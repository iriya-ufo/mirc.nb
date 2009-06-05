def bmi_desc
  "bmi>(cm),(kg): BMI��Ĵ�٤ޤ���"
end

def bmi(msg)
  if (msg !~ /^([\d\.]+),([\d\.]+)$/)
    return "bmi>(cm),(kg) �Ȥ��������ǿ�Ĺ���νŤ���ꤷ�Ʋ�������"
  end
  m = $1.to_f / 100
  kg = $2.to_f
  val = kg / m / m
  "���ʤ���BMI�� #{format('%.3f', val)} �Ǥ���" +
    if (val < 18.5)
      "�餻�����Ǥ���"
    elsif (val < 25.0)
      "���̤Ǥ���"
    elsif (val < 30.0)
      "���ꤹ���Ǥ���"
    else
      "�����Ǥ���"
    end
end
