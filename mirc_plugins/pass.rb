# -*- coding: euc-jp -*-

def log_password_file; "/home/muto/.htpasswd" end
def log_user; "tucc" end
def htpasswdcmd; "/usr/local/apache2/bin/htpasswd" end

def pass_desc
  "pass>[pass]: �������ѥѥ���ɤ��ǧ/���ꤷ�ޤ���"
end

def target_notice target, msg
  @bot.send_notice(target, e2j(msg).delete("\r\n")) if msg
end

def pass msg
  msg.strip!
  if msg.empty?
    if @pass.nil? || @pass.empty?
      "�ѥ����˺��ޤ�����Ŭ�������ꤷ�Ƥ���������"
    else
      ["���ߤΥѥ���ɤ� ��#{@pass}��",
       "�桼��̾�� tucc",
       "http://tucc.aa0.netvolante.jp/~muto/logs/today-tucc.txt",
       "http://tucc.aa0.netvolante.jp/~muto/logs/yesterday-tucc.txt",
       "�ѥ���ɤϤ���ʤ��ѹ�����ʤ��Τǡ��֥饦���Υѥ������¸��ǽ��Ȥ��Τ���������Ǥ���",
       " ",
       "���Υ��ϥ����ФΥե����륷���ƥ��� ~muto/logs/irc.edw-CS-(����ͥ�̾)/ ����¸����Ƥ��ޤ���",
       "�����äʤΤǲ�����web��ͳ�Ǥϸ������Ƥ��ޤ��󤬡������Ф�ľ��������ͤʤ�ï�Ǥ⸫����褦�ˤʤäƤ��ޤ���"
      ].each do |msg|
        target_notice(@context.nick, msg)
      end
      ""
    end
  else
    @pass = msg
    #if system("/usr/sbin/htpasswd2", "-b", log_password_file, log_user, msg)
    if system(htpasswdcmd, "-b", log_password_file, log_user, msg)
      "�ѥ���ɤ򹹿����ޤ��� #{msg}"
    else
      "�ʤ󤫥��顼�Ǥ�"
    end
  end
end
