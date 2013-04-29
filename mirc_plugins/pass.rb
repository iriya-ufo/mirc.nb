# -*- coding: euc-jp -*-

def log_password_file; "/home/misc/.htpasswd" end
def log_user; "pon" end
def htpasswdcmd; "/usr/local/apache2.2.18/bin/htpasswd" end

def pass_desc
  "pass>[pass]: ログ閲覧用パスワードを確認、設定します。"
end

def target_notice target, msg
  @bot.send_notice(target, e2j(msg).delete("\r\n")) if msg
end

def pass msg
  msg.strip!
  if msg.empty?
    if @pass.nil? || @pass.empty?
       "パスワードを忘れました。適当に設定してください。"
    else
      ["現在のパスワードは #{@pass}",
       "ユーザー名は pon",
       "http://nao.no-ip.info/~misc/irclog/irclog-%23tucc-ob/today.log",
       "http://nao.no-ip.info/~misc/irclog/irclog-%23tucc-ob/yesterday.log",
      ].each do |msg|
        target_notice(@context.nick, msg)
      end
      ""
    end
  else
    @pass = msg
    if system(htpasswdcmd, "-b", log_password_file, log_user, msg)
      "パスワードを更新しました #{msg}"
    else
      "なんかエラーです"
    end
  end
end
