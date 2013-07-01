# -*- coding: utf-8 -*-

Plugin.create(:mikutter_president) do
  command(
          :mikutter_president,
          name: 'to be President',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    to_name = opt.messages[0].user.idname
    msg = ""
    s = ["Yes,", "w", "e", "can!"]
    while TRUE do
      n_msg = s[0] * (rand(3)+1) + ' '
      if(rand > 0.5) then
        n_msg += s[1] + s[2] * (rand(4)+1)
      else
        n_msg += '@'+to_name
      end
      n_msg += ' ' + s[3]
      break if msg.split(//).size + n_msg.split(//).size >= 140
      msg += n_msg
    end
    Service.primary.post(:message => msg,
                         :replyto => opt.messages[0])
  end
end
