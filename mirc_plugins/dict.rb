# from http://www.cyber.sccs.chukyo-u.ac.jp/sirai/classes/nlp/

def dict_desc
  "dict>word: ��켭ŵ��Ҥ��ޤ���"
end

def dict(msg)
  query = toeuc(msg)  # ����ä� query �˵���
  # goo �Ǥ�EUC�����ɤ��Ȥ��Ƥ���

  # �����ѥ�����롣�ִ������ץ⡼�ɡפ����ܸ켭���ƤӽФ�
  pat="/search.php?MT=" + query+ "&jn.x=28&jn.y=10&jn=%B9%F1%B8%EC&kind=&mode=1"
  data = http_get("http://dictionary.goo.ne.jp#{pat}")

  doc = Hpricot(data)
  ary = (doc/"div.mainlst").inner_text.to_a
  if ary.size > 2
    ret = ary[1]
  else
    ret = ary.join[0..200]
  end

  if ret.empty?
    "ñ�줬���Ĥ���ޤ���"
  else
    ret
  end
end
