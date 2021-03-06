def break_hangul c
  code = c.ord - 0xAC00

  jong = code % 28
  joong = ((code-jong) / 28) % 21
  cho = ((code-jong) / 28 - joong) / 21
  
  [(cho+0x1100),(joong+0x1161),(jong+0x11A7)].map {|c| c.chr('utf-8')}
end

'안녕월드'.each_char do |b|
  puts break_hangul b
end
