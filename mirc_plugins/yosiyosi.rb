def yosiyosi_desc
  "yosiyosi>(nick): �褷�褷���ޤ���"
end

def yosiyosi(msg)
  if (rand(10) == 0)
    "#{msg}��( ��)"
  elsif (rand(10) == 0)
    "#{msg}��(��_��)"
  else
    "#{msg}��(�� )"
  end
end
