import os
import shutil
import json
import re
from string import Template

def template(color, darkColor):
  hexColor = re.findall('..' , color[1:])
  hexDarkColor = re.findall('..' , darkColor[1:])

  return Template("""
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x${hex2}",
          "green" : "0x${hex1}",
          "red" : "0x${hex0}"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x${hex5}",
          "green" : "0x${hex4}",
          "red" : "0x${hex3}"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
""").substitute(hex0=hexColor[0], hex1=hexColor[1], hex2=hexColor[2], hex3=hexDarkColor[0], hex4=hexDarkColor[1], hex5=hexDarkColor[2])



shutil.rmtree("ColorScheme.xcassets")

os.mkdir("ColorScheme.xcassets")

f = open('ColorScheme.json')

data = json.load(f)

with open("ColorScheme.swift", "w+") as swift:
  swift.write("""
import SwiftUI

public extension Color {""")

  for tag in data:
      os.mkdir("ColorScheme.xcassets/" + tag)
      colors = data[tag]
      for index, color in enumerate(colors):
        darkColor = colors[len(colors) - index - 1]
        output = template(color, darkColor)
        colorName = tag + str(index)
        path = "ColorScheme.xcassets/" + tag + "/" + colorName + ".colorset"
        os.mkdir(path)
        swift.write("\n   ///" + color)
        swift.write("\n   static let " + colorName + " = Self.init(\""+ colorName +"\")\n")

        with open(path + "/Contents.json", "w+") as file1:
          file1.write(output)
  swift.write("\n}")

f.close()