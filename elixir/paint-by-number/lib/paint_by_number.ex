defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 0)
  end

  def palette_bit_size(color_count, last_pow) do
    if Integer.pow(2, last_pow) >= color_count do
      last_pow
    else
      palette_bit_size(color_count, last_pow + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)

    case picture do
      <<>> -> nil
      <<value::size(bit_size), rest::bitstring>> -> value
    end
  end

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)

    case picture do
      <<>> -> ""
      <<value::size(bit_size), rest::bitstring>> -> rest
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
