class MarkovGenerater
  def initialize(filename)
    @next = Hash.new
    @keys = Array.new
    @prefix = "\0"

    File.new(filename).each { |line|
      line.chomp!
      for i in 0...line.length/2
        add(line[i*2,2])
      end
      add("\0")
    }

    @prefix = @keys[rand(@keys.size)]
  end

  def add(str)
    if (@next[@prefix] == nil) then
      @next[@prefix] = [str]
      if (str != "\0") then
        @keys.push(@prefix)
      end
    else
      @next[@prefix].push(str)
    end
    @prefix = str
  end

  def generate
    ret = ""
    key = "\0"
    while (key == "\0")
      key = @keys[rand(@keys.size)]
      if (ENV['QUERY_STRING'] == 'negima') then key = '��' end
    end
    while (key != "\0")
      ret += key
      n = @next[key]
      key = n[rand(n.size)]
    end

    return ret
  end

end

def spell_desc
  "spell>: ��ˡ���������ޤ���"
end

def spell(msg)
  spellsFile = "data/spells.txt"
  if (ENV['QUERY_STRING'] == 'negima') then
    spellsFile = "data/spells_negima.txt"
  end

  markov = MarkovGenerater.new(spellsFile)
  spellname = markov.generate()

  adj = [
    '', '������', '�礭��', '�㤷�������', '�ۤȤФ���', '��Ǯ��', '��',
    '�������䤹����', '�㤷��', '�Ȥ��ڤ�����$adj', '���Ƥ��ڤ���',
    '������', '���Ƥ�', '����', '1�ٹԤä�', '�夤'
  ]

  tar = [
    '��ְ��', '�������', 'Ũ', '�ޥ�', '��', '������', '������',
    'MP', '��ʬ', '��ˡ', '��ˡ����', '��', '�Хꥢ', 'Ŵ�Τ����ޤ�',
    '���᡼����', '��Ȣ', '���䤷�����'
  ]

  pref = [
    '$adj�Фζ̤�', '$adj���', '$adj��ȯ�򵯤�����', 'ɹ�οϤ�',
    '$adjε����', '$adj��ʤ�', '�Ϥ��碌��', '��θ��դ��ꤲ����',
    '�ɥ饴��ˤʤ���Ϥ�����', '̿��ΤƼ�������', '̿��ΤƤ�',
    '����', '1������δ֤���', '��������'
  ]

  suf = [
    '��$randPt�Υ��᡼��', '©�κ���ߤ��', '�ѿȤ��Ƥ���֤ϲ��˺���',
    '�λ�ޤ�����Ʈ��ǽ�ˤ���', 'HP����$randPt����', 'HP��$adj����',
    '$tar��ä����', '$tar��ľ��', '$tar��1/2�γ�Ψ�������֤餻��',
    '$tar�����������֤餻��', '$tar�������֤餻��',
    '$tar��󤯤ˤϤ������Ф�', '$tar��ä����', '$tar�򲼤���',
    '$tar�����ܤˤ���', '$tar��ۤ����',
    '$tar�μ�����$tar��$tar��ʬ�Τ�Τˤ���',
    '$adj$tar��ä����', '$tar��夲��', '$tar��$adj̲���Ͷ��',
    '$tar�����', '$tar���𤵤���', '$tar��$tar�����������',
    '$tar��Ϥ��֤�', '$tar��$tar����$tar����',
    '$tar���Ф���$tar��Ϥ�', '$tar��$tar�ˤʤ�',
    '$adjĮ��¼�˰�ư�Ǥ���', '��ʪ��ƶ������æ�Ф���',
    '$tar���$adj$tar���Фʤ��ʤ�', '$tar������᡼��������ʤ��ʤ�',
    '$tar����Ȥ򸫶ˤ��', '$tar��$tar��ȯ������', '���������뤫�狼��ʤ�'
  ]

  msg = suf[rand(suf.size)]
  if (rand(2) < 1) then
    msg = pref[rand(pref.size)] + msg
  end

  while (msg.sub!(/\$adj/, adj[rand(adj.size)]) != nil ||
           msg.sub!(/\$tar/, tar[rand(tar.size)]) != nil ||
           msg.sub!(/\$rand/, (rand(27)*rand(27)).to_s))
  end

  [spellname, msg]
end
