# -*- coding: euc-jp -*-
def s_desc
  "s>{pop,push,apply}: �����å������ޤ�"
end

def s(msg)
  msgs = msg.split
  @stack ||= []

  case msgs[0]
  when "pop"
    @stack.pop.to_s
  when "push"
    @stack.push msgs[1]
    @stack.last
  when "apply"
    s_apply
  when "show"
    "["+@stack.join(", ")+"]"
  else
    "�ʤ󤫤��������Ǥ�"
  end
end

def s_apply
  ops = ["+", "-", "*", "/"]
  if @stack.size < 3
    return "���ڥ��ɤ�­��ޤ���"
  end

  if ! ops.include? @stack.last
    return "����ʥ��ڥ졼���Τ�ޤ��� #{@stack.last}"
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
  @stack.last.to_s
end
