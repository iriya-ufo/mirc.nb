def weather_desc
  "weather>: ���縩������ŷ��ͽ����Τ餻���ޤ���"
end

def weather(msg)
  #data = http_get('http://weather.yahoo.co.jp/weather/jp/13/4410.html')
  data = http_get('http://weather.yahoo.co.jp/weather/jp/36/7110.html')

  lines=data.split(/\n/)            # �Ԥ�ʬ�䤷������ˤ����

  body=""

  colon = false
  saiko = false

  ret = Array.new

  while (line=lines.shift)
    if (/<tr align=center><td><b>([^<]*)<\/b><\/td><\/tr>$/ =~ line)
      body += "#{$1} "
      colon = true
    end
    if (colon && /^<small>([^<]*)<\/small>$/ =~ line)
      body += "#{$1}"
      colon = false
    end
	if (/\]<br>([\d]+|---)\s*$/ =~ line)
	  body += " #{$1}��"
	  if (saiko)
	    ret.push(body)
	    saiko = false
		body = ''
	  else
	    saiko = true
	  end
	end
  end

  ret
end
