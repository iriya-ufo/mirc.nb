# -*- coding: euc-jp -*-
def unko msg
  endr = "([ ��!���ġ���.,��?���åá�^������]*)"
  case j2e(msg).strip
  when /��[����]*��#{endr}$/e
    sleep(0.8)
    "��#{$1}"
  when /��[����]*��#{endr}$/e
    sleep(0.8)
    "��#{$1}"
  when /����*��#{endr}$/e
    kao("����פ���")
  when /����*��#{endr}$/e
    "�⤦��������ġ�"
  when /^�ޡ�*��#{endr}$/e
    kao("�ڤ�����")
  when /^�ޡ�*��#{endr}$/e
    "�ġ�"
  when /�̤��|�̥��#{endr}/e
    kao("����!#{$1}")
  when /�ɤ�(��|��)�Ƥ�.+�Ǥ�/e
    kao("�����ˤ��꤬�Ȥ��������ޤ�����")
#  when /^[*\d+-\/()\. %]+$/
#    calc(msg)
  end
end
