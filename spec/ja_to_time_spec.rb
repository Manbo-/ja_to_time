# -*- coding: utf-8 -*-
require "ja_to_time"

describe JaToTime do
  it do
    @ja = "2013年12月14日(土) 9時15分"
    expect(@ja.ja_to_time).to be_a_kind_of(Time)
  end

  it do
    @ja = "2013年12月14日(土) 9時15分"
    expect(@ja.ja_to_time).to eq(Time.new(2013, 12, 14, 9, 15))
  end

  it do
    @ja = "2013年12月14日(土) 午前9時15分"
    expect(@ja.ja_to_time).to eq(Time.new(2013, 12, 14, 9, 15))
  end

  it do
    @ja = "2013年12月14日(土) 午後9時15分"
    expect(@ja.ja_to_time).to eq(Time.new(2013, 12, 14, 9 + 12, 15))
  end

  it do
    @ja = "2013年12月14日(土) 深夜9時15分"
    expect(@ja.ja_to_time).to eq(Time.new(2013, 12, 14 + 1, 9, 15))
  end
end
