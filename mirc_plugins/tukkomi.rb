def tukkomi_desc
  "tukkomi>(target): �ĥå���k�ޤ�"
end

def tukkomi(msg)
  tukkomis = [
    '�򾮰�����䤤�Ĥ᤿��',
    '��ϥꥻ��ǲ��ä���',
  ]

  if msg == NICK
    Thread.new {
	    notice "hoge"
      sleep 5 
      sayingis = ['���ޥ�', '���ס�', '����ȿ�ʤ��Ƥ���']
      notice(kao(sayingis[rand(sayingis.size)]));
    }
  end

  "#{@context.nick}�ϡ�#{msg}#{tukkomis[rand(tukkomis.size)]}"
end

