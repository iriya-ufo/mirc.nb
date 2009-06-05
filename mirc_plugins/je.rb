# from http://www.cyber.sccs.chukyo-u.ac.jp/sirai/classes/nlp/
require 'rubygems'
require 'hpricot'
require 'nkf'

def je_desc
  "je>word: �±Ѽ�ŵ��Ҥ��ޤ���"
end

def je(msg)
  query = URI.encode(toeuc(msg))
  # goo �Ǥ�EUC�����ɤ��Ȥ��Ƥ���

  # �����ѥ�����롣�ִ������ץ⡼�ɡפ����ܸ켭���ƤӽФ�
  pat="/search.php?MT=" + query+ "&je.x=24&je.y=12&kind=je&mode=1"
  data = http_get("http://dictionary.goo.ne.jp#{pat}")

  doc = Hpricot(data)
#   ary = (doc/"div.mainlst").inner_text.gsub("&nbsp;", " ").
#     gsub("����", "\n----").gsub("��", ") ").gsub("��", " (").
#     gsub("��", " [[").gsub("��", "]] ").to_a
#   ary = ary.map{|i| i.strip}.delete_if{|i| i.empty? || /^----/ !~ i}
  mainlst = (doc/"div.mainlst")
  (mainlst/"br").map{|i| i.swap("\n")}
  ary = mainlst.inner_text.gsub("&nbsp;", " ").to_a.map{|i| i.strip}.delete_if{|i| i.empty?}

  if ary.empty?
    "ñ�줬���Ĥ���ޤ���"
  else
    ary
  end
end

