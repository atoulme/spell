module Wav
  
  WAV_BINARY_FORMAT = 'Z4 i Z8 i s s i i s s Z4 i s*'
  
  class Sound
    
    def self.fromFile(filename)
      from_binary_format(File.read(filename))
    end
    
    def self.from_binary_format(binary_string)
      values = binary_string.unpack WAV_BINARY_FORMAT
      sound = Sound.new
      sound.id = values[0]
      sound.totallength = values[1]
      sound.wavefmt = values[2]
      sound.format = values[3]
      sound.pcm = values[4]
      sound.channels = values[5]
      sound.frequency = values[6]
      sound.bytes_per_second = values[7]
      sound.bytes_by_capture = values[8]
      sound.bits_per_sample = values[9]
      sound.bytes_in_data = values[11]
      sound.data = values[12..-1]
      sound
    end
    
    attr_accessor :id, :totallength, :wavefmt, :format, :pcm, :channels, :frequency, :bytes_per_second, :bytes_by_capture, :bits_per_sample, :bytes_in_data, :data
    
    def combine(other)
      sound = self.clone
      sound.totallength += other.totallength
      sound.bytes_in_data += other.bytes_in_data
      sound.data += other.data
      sound
    end
    
    def to_binary_format
      ([id, totallength, wavefmt, format, pcm, channels, frequency, bytes_per_second, bytes_by_capture, bits_per_sample, "data", bytes_in_data] + data).pack('Z4 i Z8 i s s i i s s Z4 i s*')
    end
    
  end
  
end
