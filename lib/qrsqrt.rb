require "qrsqrt/version"

module Qrsqrt
  def get(number, itr = 1)
    three_halfs = 1.5

    number_uint = [number].pack('F').unpack('L')[0]
    res = 0x5f3759df - (number_uint >> 1)
    res = [res].pack('L').unpack('F')[0]

    while itr > 1 do
      res *= (three_halfs - 0.5 * number * res * res)
      itr -= 1
    end
    res
  end
end
