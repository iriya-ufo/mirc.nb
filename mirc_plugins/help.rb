def help_desc
  "help>[cmd]: ���Υإ�פ�ɽ�����ޤ�"
end

def help(msg)
  if (msg == "")
    ret = Array.new
	ret.push("help>[cmd] �� cmd �Υإ�פ�ɽ���Ǥ��ޤ������ޥ�ɤϰʲ����̤ꡣ")
	ret.push(@plugins.keys.join(', '))
    ret
  else
    if (@plugins.key?(msg))
	  @plugins[msg][0]
	else
	  "#{msg}: ����ʥ��ޥ�ɤϤ���ޤ���"
	end
  end
end

