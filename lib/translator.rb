# require modules here
require "yaml"
require "pry"
emoticons = YAML.load_file("./lib/emoticons.yml")
def load_library(path)
  emoticons = YAML.load_file(path)
  results = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning, array|
    #binding.pry
    japan = array[1]
    eng = array[0]
    results["get_meaning"][japan] = meaning
    results["get_emoticon"][eng] = japan
  end
  results
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if !library["get_emoticon"].keys.include?(emoticon)
    "Sorry, that emoticon was not found"
  else
    library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if !library["get_meaning"].keys.include?(emoticon)
    "Sorry, that emoticon was not found"
  else
    library["get_meaning"][emoticon]
  end
end
