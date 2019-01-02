require 'yaml'

def load_library(file_path)
  original_h = YAML.load_file(file_path)
  new_h = {"get_emoticon" => {}, "get_meaning" => {}}
  original_h.each do |meaning, emoticons|
    new_h["get_emoticon"][emoticons[0]] = emoticons[1]
    new_h["get_meaning"][emoticons[1]] = meaning
  end
  new_h
end

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)["get_emoticon"][emoticon]
  result == nil ? "Sorry, that emoticon was not found" : result
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)["get_meaning"][emoticon]
  result == nil ? "Sorry, that emoticon was not found" : result
end
