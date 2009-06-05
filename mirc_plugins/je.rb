# from http://www.cyber.sccs.chukyo-u.ac.jp/sirai/classes/nlp/
require 'rubygems'
require 'hpricot'
require 'nkf'

def je_desc
  "je>word: �±Ѽ����Ҥ��ޤ���"
end

def je(msg)
  query = URI.encode(msg.toutf8)
  # goo �Ǥ�utf8���Ȥ��Ƥ���

  # �����ѥ�����롣�ִ������ץ⡼�ɡפ��±Ѽ����ƤӽФ�
  url = "http://dictionary.goo.ne.jp/freewordsearcher.html?MT=#{query}&mode=1&id=top&kind=je"
  data = open(url).read

  doc = Hpricot(data)
  ary = (doc/".ja-enResultArea").inner_text.gsub("&nbsp;", " ").
    gsub("����", "\n����").toeuc.to_a

  if ary.empty?
    "ñ�줬���Ĥ���ޤ���"
  else
    ary
  end
end

