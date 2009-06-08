# -*- coding: euc-jp -*-
def _desc
  "s>{pop,push,apply} n: �����å������ޤ�"
end

def s(msg)
  msgs = msg.split
  @stack ||= []

  case msgs[0]
  when "pop"
    @stack.pop msgs[1]
  when "push"
    @stack.push msgs[1]
  when "apply"
    s_apply
  else
    "�ʤ󤫤��������Ǥ�"
  end
end

def s_apply
  ops = ["+", "-", "*", "/"]
  if @stack.size < 3
    return "���ڥ��ɤ�­��ޤ���"
  end

  if ! ops.include? @stack.first
    return "����ʥ��ڥ졼���Τ�ޤ��� #{@stack.first}"
  end

  op = @stack.pop
  a = @stack.pop.to_f
  b = @stack.pop.to_f

  @stack.push case op
              when "+"
                a + b
              when "-"
                a - b
              when "*"
                a * b
              when "/"
                a / b
              end
end
