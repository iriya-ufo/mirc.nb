# from http://www.cyber.sccs.chukyo-u.ac.jp/sirai/classes/nlp/

def dict_desc
  "dict>word: ��켭���Ҥ��ޤ���"
end

def dict(msg)
  query = URI.encode(msg.toutf8)
  # goo �Ǥ�utf8���Ȥ��Ƥ���

  # �����ѥ�����롣�ִ������ץ⡼�ɡפǹ�켭���ƤӽФ�
  url = "http://dictionary.goo.ne.jp/freewordsearcher.html?MT=#{query}&mode=1&id=top&kind=jn"
  data = open(url).read
  @logger.slog url

  doc = Hpricot(data)
  ary = (doc/".wordDefinition").inner_text.gsub("&nbsp;", " ").
    gsub("����", "\n����").toeuc.to_a

  if !ary.empty?
    return ary
  end

  ary = (doc/".resultList").inner_text.gsub("&nbsp;", " ").
    gsub("����", "\n����").toeuc.to_a

  if ary.empty?
    "ñ�줬���Ĥ���ޤ���"
  else
    ary
  end
end
