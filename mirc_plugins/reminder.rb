def reminder_desc
  "reminder>(hhmm):(msg): ��ޥ�����򥻥åȤ��ޤ���"
end

def reminder(msg)
  if (msg !~ /^\+(\d\d):(.*)/ && msg !~ /^(\d\d)(\d\d):(.*)/)
    return "�񼰻��꤬ (hhmm):(msg) �˽��äƤ��ޤ���"
  end

  diff = 0
  ret = ""
  msg = ""
  if ($3)
    h = $1.to_i
    m = $2.to_i
    msg = $3

    if (h > 23 || m > 59)
      return "��Ŭ�ڤʻ������Ǥ���"
    end

    now = Time.now
    diff = ((h-now.hour)*60+(m-now.min))*60-now.sec
    if (diff < 0)
      diff += 60*60*24
    end

    ret = "#{h}��#{m}ʬ�ˡ�#{msg}�פ��������ޤ���"
  else
    diff = 60 * $1.to_i
    msg = $2
    ret = "#{$1.to_i}ʬ��ˡ�#{msg}�פ��������ޤ���"
  end

  nick = @context.nick

  Thread.new do
    print "create reminder thraed (#{diff}sec)...\n"
    sleep(diff)

    notice("reminder by #{nick}: #{msg}")
  end

  ret
end
