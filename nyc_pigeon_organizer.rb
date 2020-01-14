def get_list(data)
  index = 0
  pigeon_list = {}
  while index < data[:gender][:male].length do
    pigeon_list[data[:gender][:male][index]] = 
    {:color => [],
    :gender => ['male'],
    :lives => []
    }
      
    index += 1 
  end 
  index = 0
  while index < data[:gender][:female].length do
    pigeon_list[data[:gender][:female][index]] = 
    {:color => [],
    :gender => ['female'],
    :lives => []
    }
      
    index += 1 
  end 
  pigeon_list
end


def finding_colors(data, pigeon_list)
  data[:color].each { |key, value| 
    p key
    p value
    
    value.each { |name| 
      pigeon_list[name][:color] << key.to_s 
    }
  }
  pigeon_list
end

def finding_homes(data, pigeon_list)
  data[:lives].each { |key, value| 
    p key
    p value
    
    value.each { |name| 
      pigeon_list[name][:lives] << key.to_s 
    }
  }
  pigeon_list
end


def nyc_pigeon_organizer(data)
  pigeon_list = get_list(data)
  colors_found = finding_colors(data, pigeon_list)
  homes_found = finding_homes(data, colors_found)
  pp homes_found
  homes_found
end

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}


nyc_pigeon_organizer(pigeon_data)
