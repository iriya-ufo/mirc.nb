def fringe_desc
  "fringe>: �˥塼�����Τ餻���ޤ���"
end

def fringe(msg)
  data = http_get('http://cnn.co.jp/fringe/fringe.html')

  lines=data.split(/\n/)            # �Ԥ�ʬ�䤷������ˤ����

  while (line=lines.shift)
    if (line =~ /<h1>/)
      line = lines.shift
      line =~ /<a href="([^"]+)">([^<]+)<\/a>/
      return [$2, "http://cnn.co.jp#{$1}"]
    end
  end

  "�ʤ󤫥��顼�Ǥ���"
end
