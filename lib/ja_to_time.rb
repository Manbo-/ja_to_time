# -*- coding: utf-8 -*-

require "moji"
require "active_support/time"

require "ja_to_time/version"

class String
  def ja_to_time
    self.zen_to_han.remove_wday.replace_date_sep.move_up_time
  end

  def zen_to_han
    ::Moji.zen_to_han(self)
  end

  def replace_date_sep
    date = %w(年 月 日).inject(self) do |date, sep|
      date.sub(sep, "/")
    end
    date.sub("時", ":").sub("分", "")
  end

  def remove_wday
    %w(月 火 水 木 金 土 日).inject(self) do |date, wday|
      date.sub(/[（\(]#{wday}[\)|）]/, "")
    end
  end

  def move_up_time
    date = Date._parse(self)
    if date[:hour] > 23
      date[:hour] -= 24
      Time.parse("#{date[:year]}/#{date[:mon]}/#{date[:mday]} #{date[:hour]}:#{date[:min]}") + 1.day
    else
      case self
      when /午後/
        Time.parse(self) + 12.hours
      when /深夜/
        Time.parse(self) + 1.day
      else
        Time.parse(self)
      end
    end
  end
end
