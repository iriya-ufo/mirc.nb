def harakiri_desc
  "harakiri>(target): ʢ���ڤäƻ�ˤޤ��������target����ߤޤ��礦"
end

def harakiri(msg)
  tamerai = rand(4) + 1

  case
  when (tamerai % 3) == 0
    "#{@context.nick}�Ϥ����ä���"

  when msg.empty?
    sleep(tamerai)
    ["�ϥ饭�꡼",
     "#{@context.nick}��ʢ���ڤä���"]

  else
    notice("#{msg}��Ĳ��������")
    sleep(tamerai)
    ["�ϥ饭�꡼!!!",
     "#{@context.nick}��ʢ���ڤä���",
     "#{msg}�㤵�����β��Ǥ⤽��ϰ�����ʡ����ء���"]
  end
end
