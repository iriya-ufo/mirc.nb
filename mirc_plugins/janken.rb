def janken_desc
  "janken>(gcp)����󤱤�ݤ�"
end

def janken(msg)
  if /\s*^([gcp])/ =~ msg
    x = $1
    k = {"g" => "p", "c" => "g", "p" => "c"}
    m = {"g" => "c", "c" => "p", "p" => "g"}
    case rand(10)
    when 0,1,2,3
      "����μ��#{x}!! �������Ǥ���"
    when 4,5,6,7,8
      "����μ��#{k[x]}!! m9�ʡ������˥ץ��㡼m9�ʡ������˥ץ��㡼m9�ʡ������˥ץ��㡼m9�ʡ������˥ץ��㡼"
    when 9
      "����μ��#{m[x]}!! ���ޥ��ξ�������ǧ��󤾤���"
    end
  else
    "gcp�Τɤ줫��Ф�"
  end
end
