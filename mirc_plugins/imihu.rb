def imihu_desc
  "imihu>[msg]: �褯�狼����ʸ����Ф��ޤ���"
end

def imihu(msg)
  if (rand(10) == 0)
    "��'��';�� #{msg}"
  else
    "��'��'�� #{msg}"
  end
end
