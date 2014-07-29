require 'datable_scan/version'

class DataBLEScan
  def initialize
    @start = ''

    run_hci_tool_scan
    print_translation_of_raw_stream
  end

  private

  def run_hci_tool_scan
    ble_scan_pid = fork { exec('hcitool lescan --duplicates') }
    Process.detach(ble_scan_pid)
  end

  def print_translation_of_raw_stream
    IO.popen('hcidump --raw').each_line do |line|
      if line.start_with?('>')
        if @start.size >= 33 && @start.start_with?('>')
          p = @start.strip[2..-1].split(/\s+/)

          power = p[-2, 1].join.hex - 256
          minor = p[-4, 2].join.hex
          major = p[-6, 2].join.hex
          uuid = [p[-22, 4],
                  p[-18, 2],
                  p[-16, 2],
                  p[-14, 2],
                  p[-12, 6]].map(&:join).join('-')

          puts "UUID: #{uuid}, MAJOR: #{major}, MINOR: #{minor}, POWER: #{power}"
        end

        @start = line if line.size > 62
      else
        @start << line
      end
    end
  end
end
