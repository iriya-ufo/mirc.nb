def calc_desc
  "calc>(formula): ����Ǥ���"
end

def calc(msg)
  if (msg !~ /^[*\d+-\/()\. %]+$/)
    "�׻������������ʤ��Ǥ�"
  elsif (msg =~ /\*\*/)
    "�Ȥꤢ�����߾�ϥ���٥󤷤Ƥ�������"
  else
    begin
      ret = `ruby -e 'print #{msg}'`
      if (ret == '')
        "���顼�äݤ��Ǥ�"
      else
        ret
      end
    rescue
      "�ʤ󤫥��顼�Ǥ�"
    end
  end
end
