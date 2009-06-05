# from http://www.cyber.sccs.chukyo-u.ac.jp/sirai/classes/nlp/
require 'rubygems'
require 'hpricot'
require 'nkf'

def ej_desc
  "ej>word: ���¼�ŵ��Ҥ��ޤ���"
end

def ej(msg)
  query = toeuc(msg)
  # goo �Ǥ�EUC�����ɤ��Ȥ��Ƥ���

  # �����ѥ�����롣�ִ������ץ⡼�ɡפ����ܸ켭���ƤӽФ�
  pat="/search.php?MT=" + query+ "&kind=ej&mode=1"
  data = http_get("http://dictionary.goo.ne.jp#{pat}")

  doc = Hpricot(data)
#   ary = (doc/"div.mainlst").inner_text.gsub("&nbsp;", " ").
#     gsub("����", "\n----").gsub("��", ") ").gsub("��", " (").
#     gsub("��", " [[").gsub("��", "]] ").to_a
#   ary = ary.map{|i| i.strip}.delete_if{|i| i.empty? || /^----/ !~ i}
  ary = (doc/"div.mainlst").inner_text.gsub("&nbsp;", " ").
    gsub("����", "\n����").to_a
  ary = ary.map{|i| i.strip}.delete_if{|i| i.empty? || /^����/ !~ i}

  if ary.empty?
    "ñ�줬���Ĥ���ޤ���"
  else
    ary
  end
end

