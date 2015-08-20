# coding: utf-8
# Based on convert script from vwall/compass-twitter-bootstrap gem.
# https://github.com/vwall/compass-twitter-bootstrap/blob/master/build/convert.rb
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this work except in compliance with the License.
# You may obtain a copy of the License in the LICENSE file, or at:
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'git'
require 'open-uri'
require 'json'
require 'strscan'
require 'forwardable'
require 'term/ansicolor'
require 'fileutils'
require 'pathname'

require_relative 'converter/fonts_conversion'
require_relative 'converter/less_conversion'
require_relative 'converter/js_conversion'
require_relative 'converter/logger'

class Converter
  extend Forwardable
  include LessConversion
  include JsConversion
  include FontsConversion

  def initialize(repo_url: 'https://stash.corp.squareup.com/scm/sq/sq-bootstrap.git', branch: 'master', save_to: {})
    @logger     = Logger.new
    @repo_url   = repo_url
    @repo       = Git.clone(@repo_url, 'tmp/repos/sq-bootstrap')
    @branch     = branch || 'master'
    @branch_sha = @repo.object(@branch).sha

    @save_to    = {
        js:    'assets/javascripts/sq-bootstrap',
        scss:  'assets/stylesheets/sq-bootstrap',
        fonts: 'assets/fonts/sq-bootstrap'}.merge(save_to)
  end

  def_delegators :@logger, :log, :log_status, :log_processing, :log_transform, :log_file_info, :log_processed, :log_http_get_file, :log_http_get_files, :silence_log

  def process_bootstrap
    log_status "Convert Bootstrap LESS to Sass"
    puts " repo   : #@repo_url"
    puts " branch : #@branch"
    puts " save to: #{@save_to.to_json}"
    puts '-' * 60

    @save_to.each { |_, v| FileUtils.mkdir_p(v) }

    process_font_assets
    process_stylesheet_assets
    process_javascript_assets
    store_version
  end

  def get_paths_by_type(dir, file_regex)
    @repo.ls_files(dir).keys.map do |path|
      Pathname.new(path).relative_path_from(Pathname.new(dir)).to_s
    end.select { |path| path =~ file_regex }
  end

  def read_files(path, files)
    contents = {}
    files.map do |name|
      filepath = File.join(path, name)
      contents[name] = @repo.show(@branch, filepath)
    end
    contents
  end

  def save_file(path, content, mode='w')
    dir = File.dirname(path)
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
    File.open(path, mode) { |file| file.write(content) }
  end

  # Update version.rb file with BOOTSTRAP_SHA
  def store_version
    path    = 'lib/sq-bootstrap-sass/version.rb'
    content = File.read(path).sub(/BOOTSTRAP_SHA\s*=\s*['"][\w]+['"]/, "BOOTSTRAP_SHA = '#@branch_sha'")
    File.open(path, 'w') { |f| f.write(content) }
  end
end
