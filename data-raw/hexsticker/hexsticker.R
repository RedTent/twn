library(hexSticker)
library(magick)

fig <- magick::image_read("DEV/hexsticker/figuur_hybi3.png")
s <- sticker(subplot = fig, s_width = 1.7, s_height = 1.7, s_x = 1, s_y = 1, 
             package = "twn", p_x = 1, p_y = 1, p_size = 18, p_color = "white", p_fontface = "bold",
             h_color = "#3e743e", h_fill = "#478547"
             )
s
