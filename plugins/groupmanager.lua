local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ b̸o̸t̸ #A̸d̸m̸i̸n̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'\n#B̸y̸ ❯❯ @'..check_markdown(msg.from.username or '')..''..msg_caption'
else
     return '✖️شما مُدیر رُبات نیستے✖️'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '✯G̸r̸o̸u̸p̸ i̸s̸ a̸l̸r̸e̸a̸d̸y̸ a̸d̸d̸e̸d̸✯\n✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..' \n #B̸y̸ ❯❯ @'..(msg.from.username or '')..''
else
return '←گروه درلیست گروه هاے مُدیریتی #باموفقیت ثبت شد✔️'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      whitelist ={},
      settings = {
          set_name = msg.to.title,
          lock_link = 'yes',
          lock_tag = 'yes',
          lock_spam = 'yes',
          lock_webpage = 'no',
          lock_markdown = 'no',
          flood = 'yes',
          lock_bots = 'yes',
          lock_pin = 'no',
          welcome = 'no',
		  lock_join = 'no',
		  lock_edit = 'no',
		  lock_arabic = 'no',
		  lock_mention = 'no',
		  lock_all = 'no',
		  num_msg_max = '5',
		  set_char = '40',
		  time_check = '2',
          },
   mutes = {
                  mute_forward = 'no',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'no',
                  mute_text = 'no',
                  mute_photo = 'no',
                  mute_gif = 'no',
                  mute_location = 'no',
                  mute_document = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                  mute_all = 'no',
				  mute_keyboard = 'no',
				  mute_game = 'no',
				  mute_inline = 'no',
				  mute_tgservice = 'no',
          }
      }
  save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '✯G̸r̸o̸u̸p̸ h̸a̸s̸ b̸e̸e̸n̸ #A̸d̸d̸e̸d̸✯\n✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..' \n #B̸y̸ ❯❯ @'..check_markdown(msg.from.username or '')..''..msg_caption
else
  return '←گروه #باموفقیت بہ گروه هاے ما افزوده شُد✅'..msg_caption
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ b̸o̸t̸ #A̸d̸m̸i̸n̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'\n#B̸y̸ ❯❯ @'..check_markdown(msg.from.username or '')..''..msg_caption'
   else
        return '✖️شما مُدیر رُبات نیستے✖️'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '✦E̸r̸o̸r̸r̸✦ \n ✘#G̸r̸o̸u̸p̸ i̸s̸ n̸o̸t̸ #A̸d̸d̸e̸d̸✘'
else
    return '✘این گروه درلیست مُدیریت ما وجود #ندارد✘'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '✯#G̸r̸o̸u̸p̸ h̸a̸s̸ b̸e̸e̸n̸ #R̸e̸m̸o̸v̸e̸d̸✯ \n#B̸y̸ ❯❯ @'..check_markdown(msg.from.username or '')..''
 else
  return '←گروه #باموفقیت از لیست مُدیریت ما حذف شد✓'
end
end

local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return "*Done!*\n W̸o̸r̸d̸ \n"..word.."\n i̸s̸ a̸l̸r̸e̸a̸d̸y̸ f̸i̸l̸t̸e̸r̸e̸d̸"
            else
         return "انجام شد! \n کلمه "..word.." از قبل درلیست فیلتر وجود داشت✓"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "*✦Done!* \n W̸o̸r̸d̸ \n "..word.." \n a̸d̸d̸e̸d̸ t̸o̸ f̸i̸l̸t̸e̸r̸e̸d̸ w̸o̸r̸d̸s̸ l̸i̸s̸t̸✧"
            else
         return "_کلمه_ *"..word.."* _به لیست کلمات فیلتر شده اضافه شد_"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "*✦Done!* \n W̸o̸r̸d̸ \n "..word.." \n #r̸e̸m̸o̸v̸e̸d̸ f̸r̸o̸m̸ f̸i̸l̸t̸e̸r̸e̸d̸ w̸o̸r̸d̸s̸ #l̸i̸s̸t̸✯"
       elseif lang then
         return "_کلمه_ *"..word.."* _از لیست کلمات فیلتر شده حذف شد_"
     end
      else
       if not lang then
         return "*✦Done!* \n W̸o̸r̸d̸ \n "..word.." \n i̸s̸ N̸o̸t̸ f̸i̸l̸t̸e̸r̸e̸d̸✯"
       elseif lang then
         return "_کلمه_ *"..word.."* _از قبل فیلتر نبود_"
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "✦E̸r̸o̸r̸r̸✦ \n ✦G̸r̸o̸u̸p̸ i̸s̸ n̸o̸t̸ a̸d̸d̸e̸d̸  \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'"
 else
    return "✘این گروه درلیست مُدیریت ما وجود #ندارد✘"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "✦E̸r̸o̸r̸r̸✦ \n  ✘N̸o̸ m̸o̸d̸e̸r̸a̸t̸o̸r̸ i̸n̸ t̸h̸i̸s̸ g̸r̸o̸u̸p̸✘"
else
   return "✘درحال حاضر هیچ مُدیرے براے گروه انتخاب نشده است✘"
  end
end
if not lang then
   message = '#L̸i̸s̸t̸ o̸f̸ m̸o̸d̸e̸r̸a̸t̸o̸r̸s̸ :\n'
else
   message = '*←لیست #مدیران گروه شما :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return "✦E̸r̸o̸r̸r̸✦ \n ✦G̸r̸o̸u̸p̸ i̸s̸ n̸o̸t̸ a̸d̸d̸e̸d̸  \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'"..msg_caption
else
return "✘این گروه درلیست مُدیریت ما وجود #ندارد✘"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return "✦E̸r̸o̸r̸r̸✦ \n  ✘N̸o̸ o̸w̸n̸e̸r̸ i̸n̸ t̸h̸i̸s̸ g̸r̸o̸u̸p̸✘"
else
    return "✘درحال حاضر هیچ مالڪے براے گروه انتخاب نشده است✘"
  end
end
if not lang then
   message = '#L̸i̸s̸t̸ o̸f̸ m̸o̸d̸e̸r̸a̸t̸o̸r̸s̸ :\n'
else
   message = '←لیست #مالڪین گروه شما :\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "*✦E̸r̸o̸r̸r̸✦* \n ✦G̸r̸o̸u̸p̸ i̸s̸ n̸o̸t̸ a̸d̸d̸e̸d̸  \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_✘این گروه درلیست مُدیریت ما وجود #ندارد✘_", 0, "md")
     end
  end
    if cmd == "setwhitelist" then
local function setwhitelist_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ i̸n̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* * از قبل در #لیست سفید بود✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ A̸d̸d̸e̸d̸ t̸o̸ w̸h̸i̸t̸e̸ l̸i̸s̸t̸✯ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *بہ لیست سفید #باموفقیت اضافہ شد✓*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, setwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "remwhitelist" then
local function remwhitelist_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ N̸o̸t̸ i̸n̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').." ", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل در #لیست سفید نبود✓*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ r̸e̸m̸o̸v̸e̸d̸ f̸r̸o̸m̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید #باموفقیت حذف شد✓*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, remwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ a̸ #G̸r̸o̸u̸p̸ #o̸w̸n̸e̸r̸✯ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل #صاحب گروه بود✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸w̸ t̸h̸e̸ #g̸r̸o̸u̸p̸ #o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *#باموفقیت بہ مقام صاحب گروه منتصب شد ✓*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ a̸ #M̸o̸d̸e̸r̸a̸t̸o̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* از قبل مُدیر گروه بود ✓", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ #P̸r̸o̸m̸o̸t̸e̸d̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *به مقام مدیر گروه #منتصب شد✓*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸t̸ a̸ G̸r̸o̸u̸p̸ o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل #صاحب گروه نبود✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸ l̸o̸n̸g̸e̸r̸ a̸ G̸r̸o̸u̸p̸ o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از مقام #صاحب گروه برکنار شد ✓*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸t̸ a̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل #مدیر گروه نبود✓*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ D̸e̸m̸o̸t̸e̸d̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از مقام #مدیر گروه برکنار شد ✓*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "me" then
local function id_cb(arg, data)
return tdcli.sendMessage(arg.chat_id, "", 0, ""..data.id_.."", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_←کاربر یافت نشد✘_", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "✦E̸r̸o̸r̸r̸✦\n ✘U̸s̸e̸r̸ N̸o̸t̸ F̸o̸u̸n̸d̸✘ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "✦E̸r̸o̸r̸r̸✦ \n ✦G̸r̸o̸u̸p̸ i̸s̸ n̸o̸t̸ a̸d̸d̸e̸d̸  \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_✘این گروه درلیست مُدیریت ما وجود #ندارد✘_", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ i̸n̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل در #لیست سفید بود✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ A̸d̸d̸e̸d̸ t̸o̸ w̸h̸i̸t̸e̸ l̸i̸s̸t̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *بہ لیست سفید #باموفقیت اضافہ شد✓*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ N̸o̸t̸ i̸n̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل در #لیست سفید نبود✓*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ r̸e̸m̸o̸v̸e̸d̸ f̸r̸o̸m̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید #باموفقیت حذف شد✓*", 0, "md")
   end
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ a̸ #G̸r̸o̸u̸p̸ #o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل #صاحب گروه بود✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸w̸ t̸h̸e̸ #g̸r̸o̸u̸p̸ #o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *#باموفقیت بہ مقام صاحب گروه منتصب شد ✓*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ a̸ #M̸o̸d̸e̸r̸a̸t̸o̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل #مُدیر گروه بود ✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ #P̸r̸o̸m̸o̸t̸e̸d̸✯", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *به مقام مدیر گروه منتصب شد*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸t̸ a̸ G̸r̸o̸u̸p̸ o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل #صاحب گروه نبود✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸ l̸o̸n̸g̸e̸r̸ a̸ G̸r̸o̸u̸p̸ o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از مقام #صاحب گروه #باموفقیت برکنار شد✓*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸t̸ a̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* از قبل مُدیر گروه #نبود✓", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ D̸e̸m̸o̸t̸e̸d̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از مقام مُدیر گروه #باموفقیت برکنار شُد✓", 0, "md")
   end
end
   if cmd == "me" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "`["..data.id_.."]`", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "R̸e̸s̸u̸l̸t̸ f̸o̸r̸ `[ "..check_markdown(data.type_.user_.username_).." ]` :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " `["..data.id_.."]`\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
  else
     text = " ▪️←اطلاعات کاربر← [ @"..check_markdown(data.type_.user_.username_).." ] :\n"
    .. "▫️←نام کاربر←".. check_markdown(data.title_) .."\n"
    .. "▪️←شناسه کاربر← [`".. data.id_ .."`]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر یافت نشد✘_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✦E̸r̸o̸r̸r̸✦\n ✘U̸s̸e̸r̸ N̸o̸t̸ F̸o̸u̸n̸d̸✘\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "✦E̸r̸o̸r̸r̸✦ \n ✦G̸r̸o̸u̸p̸ i̸s̸ n̸o̸t̸ a̸d̸d̸e̸d̸  \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "_✘این گروه درلیست مُدیریت ما وجود #ندارد✘_", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ i̸n̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.." *از قبل در #لیست سفید بود✓", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ `["..user_name.."]` I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ A̸d̸d̸e̸d̸ t̸o̸ w̸h̸i̸t̸e̸ l̸i̸s̸t̸✯", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *بہ لیست سفید #باموفقیت اضافہ شد✓*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!* \n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ N̸o̸t̸ i̸n̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* از قبل در #لیست سفید نبود✓", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ r̸e̸m̸o̸v̸e̸d̸ f̸r̸o̸m̸ w̸h̸i̸t̸e̸ #l̸i̸s̸t̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید #باموفقیت حذف شد✓*", 0, "md")
   end
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ a̸ #G̸r̸o̸u̸p̸ #o̸w̸n̸e̸r̸✯ \n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." "..data.id_.."از قبل #صاحب گروه بود ✓", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸w̸ t̸h̸e̸ #g̸r̸o̸u̸p̸ #o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *#باموفقیت بہ مقام صاحب گروه منتصب شد ✓*", 0, "md")
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ a̸l̸r̸e̸a̸d̸y̸ a̸ #M̸o̸d̸e̸r̸a̸t̸o̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل مُدیر گروه بود ✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ #P̸r̸o̸m̸o̸t̸e̸d̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *#باموفقیت بہ مقام مدیر گروه منتصب شد ✓*", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸t̸ a̸ G̸r̸o̸u̸p̸ o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل #صاحب گروه نبود✓*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸ l̸o̸n̸g̸e̸r̸ a̸ G̸r̸o̸u̸p̸ o̸w̸n̸e̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از مقام #صاحب گروه #باموفقیت برکنار شد✓*", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` i̸s̸ n̸o̸t̸ a̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از قبل مُدیر گروه #نبود✓*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*✦Done!*\n ✯U̸s̸e̸r̸ ["..user_name.."] I̸D̸ `["..data.id_.."]` h̸a̸s̸ b̸e̸e̸n̸ D̸e̸m̸o̸t̸e̸d̸✯\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر_ "..user_name.." *"..data.id_.."* *از مقام مُدیر گروه #باموفقیت برکنار شُد✓*", 0, "md")
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = '✦E̸r̸o̸r̸r̸✦ \n ✘U̸s̸e̸r̸ N̸o̸t̸ F̸o̸u̸n̸d̸✘ \n#B̸y̸ ❯❯ @'..check_markdown(msg.from.username or '').."'
 else
username = 'ندارد'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, '▪️I̸n̸f̸o̸ f̸o̸r̸ `[ '..data.id_..' ]` :\n▫️U̸s̸e̸r̸N̸a̸m̸e̸ : '..username..'\n▪️N̸a̸m̸e̸ : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, '▪️اطلاعات براے `[ '..data.id_..' ]` :\n▫️یوزرنیم : '..username..'\n▪️نام : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "✦E̸r̸o̸r̸r̸✦ \n ✘U̸s̸e̸r̸ N̸o̸t̸ F̸o̸u̸n̸d̸✘\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر یافت نشد✘_", 0, "md")
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_←کاربر یافت نشد✘_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "✦E̸r̸o̸r̸r̸✦ \n ✘U̸s̸e̸r̸ N̸o̸t̸ F̸o̸u̸n̸d̸✘\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."", 0, "md")
      end
   end
end


---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ L̸i̸n̸k̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال لینک در گروه هم اکنون ممنوع است"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ L̸i̸n̸k̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ارسال لینک در گروه ممنوع شد"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "*✦Done!*\n ❂➤ L̸i̸n̸k̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ارسال لینک در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ L̸i̸n̸k̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ارسال لینک در گروه آزاد شد"
end
end
end

---------------Lock Tag-------------------
local function lock_tag(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"] 
if lock_tag == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ T̸a̸g̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال تگ در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_tag"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ T̸a̸g̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ارسال تگ در گروه ممنوع شد"
end
end
end

local function unlock_tag(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end 
end

local lock_tag = data[tostring(target)]["settings"]["lock_tag"]
 if lock_tag == "no" then
if not lang then
return "*✦Done!*\n ❂➤ T̸a̸g̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ارسال تگ در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_tag"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ T̸a̸g̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ارسال تگ در گروه آزاد شد"
end
end
end

---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸e̸n̸t̸i̸o̸n̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال فراخوانی افراد هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "*✦Done!*\n ❂➤ M̸e̸n̸t̸i̸o̸n̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else 
 return "ارسال فراخوانی افراد در گروه ممنوع شد"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸e̸n̸t̸i̸o̸n̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ارسال فراخوانی افراد در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸e̸n̸t̸i̸o̸n̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ارسال فراخوانی افراد در گروه آزاد شد"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ A̸r̸a̸b̸i̸c̸/P̸e̸r̸s̸i̸a̸n̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال کلمات عربی/فارسی در گروه هم اکنون ممنوع است"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ A̸r̸a̸b̸i̸c̸/P̸e̸r̸s̸i̸a̸n̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ارسال کلمات عربی/فارسی در گروه ممنوع شد"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "*✦Done!*\n ❂➤ A̸r̸a̸b̸i̸c̸/P̸e̸r̸s̸i̸a̸n̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ارسال کلمات عربی/فارسی در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ A̸r̸a̸b̸i̸c̸/P̸e̸r̸s̸i̸a̸n̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ارسال کلمات عربی/فارسی در گروه آزاد شد"
end
end
end

---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ E̸d̸i̸t̸i̸n̸g̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ویرایش پیام هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ E̸d̸i̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ویرایش پیام در گروه ممنوع شد"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "*✦Done!*\n ❂➤ E̸d̸i̸t̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ویرایش پیام در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ E̸d̸i̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ویرایش پیام در گروه آزاد شد"
end
end
end

---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ S̸p̸a̸m̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال هرزنامه در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ S̸p̸a̸m̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ارسال هرزنامه در گروه ممنوع شد"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "*✦Done!*\n ❂➤ S̸p̸a̸m̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
 return "ارسال هرزنامه در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
if not lang then 
return "*✦Done!*\n ❂➤ S̸p̸a̸m̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
 return "ارسال هرزنامه در گروه آزاد شد"
end
end
end

---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ F̸l̸o̸o̸d̸i̸n̸g̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال پیام مکرر در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ F̸l̸o̸o̸d̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ارسال پیام مکرر در گروه ممنوع شد"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "*✦Done!*\n ❂➤ F̸l̸o̸o̸d̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ارسال پیام مکرر در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ F̸l̸o̸o̸d̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ارسال پیام مکرر در گروه آزاد شد"
end
end
end

---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ B̸o̸t̸s̸ P̸r̸o̸t̸e̸c̸t̸i̸o̸n̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "محافظت از گروه در برابر ربات ها هم اکنون فعال است"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ B̸o̸t̸s̸ P̸r̸o̸t̸e̸c̸t̸i̸o̸n̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "محافظت از گروه در برابر ربات ها فعال شد"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "*✦Done!*\n ❂➤ B̸o̸t̸s̸ P̸r̸o̸t̸e̸c̸t̸i̸o̸n̸ I̸s̸ N̸o̸t̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "محافظت از گروه در برابر ربات ها غیر فعال است"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ B̸o̸t̸s̸ P̸r̸o̸t̸e̸c̸t̸i̸o̸n̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "محافظت از گروه در برابر ربات ها غیر فعال شد"
end
end
end

---------------Lock Join-------------------
local function lock_join(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ L̸o̸c̸k̸ J̸o̸i̸n̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ورود به گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_join"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ L̸o̸c̸k̸ J̸o̸i̸n̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ورود به گروه ممنوع شد"
end
end
end

local function unlock_join(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == "no" then
if not lang then
return "*✦Done!*\n ❂➤ L̸o̸c̸k̸ J̸o̸i̸n̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ورود به گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_join"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ L̸o̸c̸k̸ J̸o̸i̸n̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ورود به گروه آزاد شد"
end
end
end

---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "*✦Done!*\n ❂➤ M̸a̸r̸k̸d̸o̸w̸n̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال پیام های دارای فونت در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸a̸r̸k̸d̸o̸w̸n̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ارسال پیام های دارای فونت در گروه ممنوع شد"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸a̸r̸k̸d̸o̸w̸n̸ P̸o̸s̸t̸i̸n̸g̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
return "ارسال پیام های دارای فونت در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸a̸r̸k̸d̸o̸w̸n̸ P̸o̸s̸t̸i̸n̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "ارسال پیام های دارای فونت در گروه آزاد شد"
end
end
end

---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ W̸e̸b̸p̸a̸g̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "ارسال صفحات وب در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ W̸e̸b̸p̸a̸g̸e̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "ارسال صفحات وب در گروه ممنوع شد"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "*✦Done!*\n ❂➤ W̸e̸b̸p̸a̸g̸e̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "ارسال صفحات وب در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ W̸e̸b̸p̸a̸g̸e̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "ارسال صفحات وب در گروه آزاد شد"
end
end
end

---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ P̸i̸n̸n̸e̸d̸ M̸e̸s̸s̸a̸g̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "سنجاق کردن پیام در گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ P̸i̸n̸n̸e̸d̸ M̸e̸s̸s̸a̸g̸e̸ H̸a̸s̸ B̸e̸e̸n̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "سنجاق کردن پیام در گروه ممنوع شد"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "*✦Done!*\n ❂➤ P̸i̸n̸n̸e̸d̸ M̸e̸s̸s̸a̸g̸e̸ I̸s̸ N̸o̸t̸ L̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "سنجاق کردن پیام در گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ P̸i̸n̸n̸e̸d̸ M̸e̸s̸s̸a̸g̸ H̸a̸s̸ B̸e̸e̸n̸ U̸n̸l̸o̸c̸k̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "سنجاق کردن پیام در گروه آزاد شد"
end
end
end

function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
  return "✘شما مُدیر گروه نیستی✘"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
if data[tostring(target)]["settings"]["set_char"] then 	
SETCHAR = tonumber(data[tostring(target)]['settings']['set_char'])
	print('custom'..SETCHAR) 	
else 	
SETCHAR = 40
end
if data[tostring(target)]["settings"]["time_check"] then 	
TIME_CHECK = tonumber(data[tostring(target)]['settings']['time_check'])
	print('custom'..TIME_CHECK) 	
else 	
TIME_CHECK = 2
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_tag"] then			
data[tostring(target)]["settings"]["lock_tag"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_pin"] then			
 data[tostring(target)]["settings"]["lock_pin"] = "no"		
 end
 end
 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_join"] then			
 data[tostring(target)]["settings"]["lock_join"] = "no"		
 end
 end
 local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
if lang then
	expire_date = 'نامحدود!'
else
	expire_date = '🌟U̸n̸l̸i̸m̸i̸t̸e̸d̸!🌟'
end
else
	local day = math.floor(expi / 86400) + 1
if lang then
	expire_date = day..' روز'
else
	expire_date = day..' D̸a̸y̸s̸'
end
end
if not lang then

local settings = data[tostring(target)]["settings"] 
 text = "*Group Settings:*\n_Lock edit :_ *"..settings.lock_edit.."*\n_Lock links :_ *"..settings.lock_link.."*\n_Lock tags :_ *"..settings.lock_tag.."*\n_Lock Join :_ *"..settings.lock_join.."*\n_Lock flood :_ *"..settings.flood.."*\n_Lock spam :_ *"..settings.lock_spam.."*\n_Lock mention :_ *"..settings.lock_mention.."*\n_Lock arabic :_ *"..settings.lock_arabic.."*\n_Lock webpage :_ *"..settings.lock_webpage.."*\n_Lock markdown :_ *"..settings.lock_markdown.."*\n_Group welcome :_ *"..settings.welcome.."*\n_Lock pin message :_ *"..settings.lock_pin.."*\n_Bots protection :_ *"..settings.lock_bots.."*\n_Flood sensitivity :_ *"..NUM_MSG_MAX.."*\n_Character sensitivity :_ *"..SETCHAR.."*\n_Flood check time :_ *"..TIME_CHECK.."*\n*____________________*\n_Expire Date :_ *"..expire_date.."*\n*Bot channel*: @LockerTeam\n*Group Language* : *EN*"
else
local settings = data[tostring(target)]["settings"] 
 text = "*تنظیمات گروه:*\n_قفل ویرایش پیام :_ *"..settings.lock_edit.."*\n_قفل لینک :_ *"..settings.lock_link.."*\n_قفل ورود :_ *"..settings.lock_join.."*\n_قفل تگ :_ *"..settings.lock_tag.."*\n_قفل پیام مکرر :_ *"..settings.flood.."*\n_قفل هرزنامه :_ *"..settings.lock_spam.."*\n_قفل فراخوانی :_ *"..settings.lock_mention.."*\n_قفل عربی :_ *"..settings.lock_arabic.."*\n_قفل صفحات وب :_ *"..settings.lock_webpage.."*\n_قفل فونت :_ *"..settings.lock_markdown.."*\n_پیام خوشآمد گویی :_ *"..settings.welcome.."*\n_قفل سنجاق کردن :_ *"..settings.lock_pin.."*\n_محافظت در برابر ربات ها :_ *"..settings.lock_bots.."*\n_حداکثر پیام مکرر :_ *"..NUM_MSG_MAX.."*\n_حداکثر حروف مجاز :_ *"..SETCHAR.."*\n_زمان بررسی پیام های مکرر :_ *"..TIME_CHECK.."*\n*____________________*\n_تاریخ انقضا :_ *"..expire_date.."*\n*کانال ما*: @LockerTeam\n_زبان سوپرگروه_ : *FA*"
end
return text
end
--------Mutes---------
--------Mute all--------------------------
local function mute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ '..msg.to.title..'" 
else
return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "yes" then 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸l̸l̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن همه فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "yes"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸l̸l̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن همه فعال شد"
end
end
end

local function unmute_all(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then 
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_all = data[tostring(target)]["mutes"]["mute_all"] 
if mute_all == "no" then 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸l̸l̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن همه غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_all"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸l̸l̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن همه غیر فعال شد"
end 
end
end

---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸i̸f̸ i̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "✘شما مُدیر گروه نیستی✘"
end
else
 data[tostring(target)]["mutes"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸i̸f̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن تصاویر متحرک فعال شد"
end
end
end
------------------------
local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_gif = data[tostring(target)]["mutes"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸i̸f̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن تصاویر متحرک غیر فعال بود"
end
else 
data[tostring(target)]["mutes"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸i̸f̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن تصاویر متحرک غیر فعال شد"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸a̸m̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن بازی های تحت وب فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸a̸m̸e̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن بازی های تحت وب فعال شد"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local mute_game = data[tostring(target)]["mutes"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸a̸m̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن بازی های تحت وب غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ G̸a̸m̸e̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن بازی های تحت وب غیر فعال شد"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ I̸n̸l̸i̸n̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن کیبورد شیشه ای فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ I̸n̸l̸i̸n̸e̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن کیبورد شیشه ای فعال شد"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_inline = data[tostring(target)]["mutes"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ I̸n̸l̸i̸n̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن کیبورد شیشه ای غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ I̸n̸l̸i̸n̸e̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن کیبورد شیشه ای غیر فعال شد"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"] 
if mute_text == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸e̸x̸t̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن متن فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸e̸x̸t̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن متن فعال شد"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local mute_text = data[tostring(target)]["mutes"]["mute_text"]
 if mute_text == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸e̸x̸t̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
return "بیصدا کردن متن غیر فعال است" 
end
else 
data[tostring(target)]["mutes"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸e̸x̸t̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن متن غیر فعال شد"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_photo = data[tostring(target)]["mutes"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ P̸h̸o̸t̸o̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن عکس فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ P̸h̸o̸t̸o̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن عکس فعال شد"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end
 
local mute_photo = data[tostring(target)]["mutes"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ P̸h̸o̸t̸o̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن عکس غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ P̸h̸o̸t̸o̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن عکس غیر فعال شد"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_video = data[tostring(target)]["mutes"]["mute_video"] 
if mute_video == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸i̸d̸e̸o̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن فیلم فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸i̸d̸e̸o̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن فیلم فعال شد"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_video = data[tostring(target)]["mutes"]["mute_video"]
 if mute_video == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸i̸d̸e̸o̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن فیلم غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸i̸d̸e̸o̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن فیلم غیر فعال شد"
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸u̸d̸i̸o̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن آهنگ فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸u̸d̸i̸o̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else 
return "بیصدا کردن آهنگ فعال شد"
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_audio = data[tostring(target)]["mutes"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸u̸d̸i̸o̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن آهنک غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ A̸u̸d̸i̸o̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "بیصدا کردن آهنگ غیر فعال شد" 
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸o̸i̸c̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن صدا فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸o̸i̸c̸e̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن صدا فعال شد"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_voice = data[tostring(target)]["mutes"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸o̸i̸c̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن صدا غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ V̸o̸i̸c̸e̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن صدا غیر فعال شد"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ S̸t̸i̸c̸k̸e̸r̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن برچسب فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ S̸t̸i̸c̸k̸e̸r̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن برچسب فعال شد"
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local mute_sticker = data[tostring(target)]["mutes"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ S̸t̸i̸c̸k̸e̸r̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن برچسب غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ S̸t̸i̸c̸k̸e̸r̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "بیصدا کردن برچسب غیر فعال شد"
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ C̸o̸n̸t̸a̸c̸t̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن مخاطب فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ C̸o̸n̸t̸a̸c̸t̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن مخاطب فعال شد"
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_contact = data[tostring(target)]["mutes"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ C̸o̸n̸t̸a̸c̸t̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن مخاطب غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ C̸o̸n̸t̸a̸c̸t̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن مخاطب غیر فعال شد"
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ F̸o̸r̸w̸a̸r̸d̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن نقل قول فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ F̸o̸r̸w̸a̸r̸d̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن نقل قول فعال شد"
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_forward = data[tostring(target)]["mutes"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ F̸o̸r̸w̸a̸r̸d̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
return "بیصدا کردن نقل قول غیر فعال است"
end 
else 
data[tostring(target)]["mutes"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ F̸o̸r̸w̸a̸r̸d̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن نقل قول غیر فعال شد"
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_location = data[tostring(target)]["mutes"]["mute_location"] 
if mute_location == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ L̸o̸c̸a̸t̸i̸o̸n̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن موقعیت فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ L̸o̸c̸a̸t̸i̸o̸n̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن موقعیت فعال شد"
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_location = data[tostring(target)]["mutes"]["mute_location"]
 if mute_location == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ L̸o̸c̸a̸t̸i̸o̸n̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن موقعیت غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ L̸o̸c̸a̸t̸i̸o̸n̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن موقعیت غیر فعال شد"
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_document = data[tostring(target)]["mutes"]["mute_document"] 
if mute_document == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ D̸o̸c̸u̸m̸e̸n̸t̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن اسناد فعال لست"
end
else
 data[tostring(target)]["mutes"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ D̸o̸c̸u̸m̸e̸n̸t̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
 return "بیصدا کردن اسناد فعال شد"
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end
end 

local mute_document = data[tostring(target)]["mutes"]["mute_document"]
 if mute_document == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ D̸o̸c̸u̸m̸e̸n̸t̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
elseif lang then
return "بیصدا کردن اسناد غیر فعال است"
end
else 
data[tostring(target)]["mutes"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ D̸o̸c̸u̸m̸e̸n̸t̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '').."" 
else
return "بیصدا کردن اسناد غیر فعال شد"
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸g̸S̸e̸r̸v̸i̸c̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن خدمات تلگرام فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸g̸S̸e̸r̸v̸i̸c̸e̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "بیصدا کردن خدمات تلگرام فعال شد"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local mute_tgservice = data[tostring(target)]["mutes"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸g̸S̸e̸r̸v̸i̸c̸e̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
return "بیصدا کردن خدمات تلگرام غیر فعال است"
end 
else 
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ T̸g̸S̸e̸r̸v̸i̸c̸e̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "بیصدا کردن خدمات تلگرام غیر فعال شد"
end 
end
end

---------------Mute Keyboard-------------------
local function mute_keyboard(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title..""
else
 return "✘شما مُدیر گروه نیستی✘"
end
end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"] 
if mute_keyboard == "yes" then
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ K̸e̸y̸b̸o̸a̸r̸d̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
 return "بیصدا کردن صفحه کلید فعال است"
end
else
 data[tostring(target)]["mutes"]["mute_keyboard"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ K̸e̸y̸b̸o̸a̸r̸d̸ H̸a̸s̸ B̸e̸e̸n̸ E̸n̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "بیصدا کردن صفحه کلید فعال شد"
end
end
end

local function unmute_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "✘شما مُدیر گروه نیستی✘"
end 
end

local mute_keyboard = data[tostring(target)]["mutes"]["mute_keyboard"]
 if mute_keyboard == "no" then
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ K̸e̸y̸b̸o̸a̸r̸d̸ I̸s̸ A̸l̸r̸e̸a̸d̸y̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
return "بیصدا کردن صفحه کلید غیرفعال است"
end 
else 
data[tostring(target)]["mutes"]["mute_keyboard"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*✦Done!*\n ❂➤ M̸u̸t̸e̸ K̸e̸y̸b̸o̸a̸r̸d̸ H̸a̸s̸ B̸e̸e̸n̸ D̸i̸s̸a̸b̸l̸e̸d̸\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
else
return "بیصدا کردن صفحه کلید غیرفعال شد"
end 
end
end
----------MuteList---------
local function mutes(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 	return "*✦E̸r̸o̸r̸r̸✦*\n✘Y̸o̸u̸ a̸r̸e̸ n̸o̸t̸ M̸o̸d̸e̸r̸a̸t̸o̸r̸✘ \n ✦G̸r̸o̸u̸p̸ N̸a̸m̸e ̸❯❯ "..msg.to.title.."\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""	
else
 return "✘شما مُدیر گروه نیستی✘"
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_all"] then			
data[tostring(target)]["mutes"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_gif"] then			
data[tostring(target)]["mutes"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_text"] then			
data[tostring(target)]["mutes"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_photo"] then			
data[tostring(target)]["mutes"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_video"] then			
data[tostring(target)]["mutes"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_audio"] then			
data[tostring(target)]["mutes"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_voice"] then			
data[tostring(target)]["mutes"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_sticker"] then			
data[tostring(target)]["mutes"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_contact"] then			
data[tostring(target)]["mutes"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_forward"] then			
data[tostring(target)]["mutes"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_location"] then			
data[tostring(target)]["mutes"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_document"] then			
data[tostring(target)]["mutes"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_tgservice"] then			
data[tostring(target)]["mutes"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_inline"] then			
data[tostring(target)]["mutes"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_game"] then			
data[tostring(target)]["mutes"]["mute_game"] = "no"		
end
end
if data[tostring(target)]["mutes"] then		
if not data[tostring(target)]["mutes"]["mute_keyboard"] then			
data[tostring(target)]["mutes"]["mute_keyboard"] = "no"		
end
end
if not lang then
local mutes = data[tostring(target)]["mutes"] 
 text = " *Group Mute List* : \n_Mute all : _ *"..mutes.mute_all.."*\n_Mute gif :_ *"..mutes.mute_gif.."*\n_Mute text :_ *"..mutes.mute_text.."*\n_Mute inline :_ *"..mutes.mute_inline.."*\n_Mute game :_ *"..mutes.mute_game.."*\n_Mute photo :_ *"..mutes.mute_photo.."*\n_Mute video :_ *"..mutes.mute_video.."*\n_Mute audio :_ *"..mutes.mute_audio.."*\n_Mute voice :_ *"..mutes.mute_voice.."*\n_Mute sticker :_ *"..mutes.mute_sticker.."*\n_Mute contact :_ *"..mutes.mute_contact.."*\n_Mute forward :_ *"..mutes.mute_forward.."*\n_Mute location :_ *"..mutes.mute_location.."*\n_Mute document :_ *"..mutes.mute_document.."*\n_Mute TgService :_ *"..mutes.mute_tgservice.."*\n_Mute Keyboard :_ *"..mutes.mute_keyboard.."*\n*____________________*\n*Bot channel*: @LockerTeam\n*Group Language* : *EN*"
else
local mutes = data[tostring(target)]["mutes"] 
 text = " *لیست بیصدا ها* : \n_بیصدا همه : _ *"..mutes.mute_all.."*\n_بیصدا تصاویر متحرک :_ *"..mutes.mute_gif.."*\n_بیصدا متن :_ *"..mutes.mute_text.."*\n_بیصدا کیبورد شیشه ای :_ *"..mutes.mute_inline.."*\n_بیصدا بازی های تحت وب :_ *"..mutes.mute_game.."*\n_بیصدا عکس :_ *"..mutes.mute_photo.."*\n_بیصدا فیلم :_ *"..mutes.mute_video.."*\n_بیصدا آهنگ :_ *"..mutes.mute_audio.."*\n_بیصدا صدا :_ *"..mutes.mute_voice.."*\n_بیصدا برچسب :_ *"..mutes.mute_sticker.."*\n_بیصدا مخاطب :_ *"..mutes.mute_contact.."*\n_بیصدا نقل قول :_ *"..mutes.mute_forward.."*\n_بیصدا موقعیت :_ *"..mutes.mute_location.."*\n_بیصدا اسناد :_ *"..mutes.mute_document.."*\n_بیصدا خدمات تلگرام :_ *"..mutes.mute_tgservice.."*\n_بیصدا صفحه کلید :_ *"..mutes.mute_keyboard.."*\n*____________________*\n*Bot channel*: @LockerTeam\n_زبان سوپرگروه_ : *FA*"
end
return text
end

local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local Chash = "cmd_lang:"..msg.to.id
local Clang = redis:get(Chash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
if msg.to.type ~= 'pv' then
if ((matches[1] == "add" and not Clang) or (matches[1] == "نصب" and Clang)) then
return modadd(msg)
end
if ((matches[1] == "rem" and not Clang) or (matches[1] == "حذف گروه" and Clang)) then
return modrem(msg)
end
if not data[tostring(msg.to.id)] then return end
if (matches[1] == "me" and not Clang) or (matches[1] == "من" and Clang) then
if not matches[2] and not msg.reply_id then
local function getpro(arg, data)
   if data.photos_[0] then
       if not lang then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'Chat ID : '..msg.to.id..'\nUser ID : '..msg.from.id,dl_cb,nil)
       elseif lang then
          tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'شناسه گروه : '..msg.to.id..'\nشناسه شما : '..msg.from.id,dl_cb,nil)
     end
   else
       if not lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "`Y̸o̸u̸ H̸a̸v̸e̸ N̸o̸t̸ P̸r̸o̸f̸i̸l̸e̸ P̸h̸o̸t̸o̸...!`\n̸\n̸> *C̸h̸a̸t̸ I̸D̸ :*`"..msg.to.id.."`\n*U̸s̸e̸r̸ I̸D̸ :*`"..msg.from.id.."`", 1, 'md')
       elseif lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "_شما هیچ عکسی ندارید...!_\n\n> _شناسه گروه :_ `"..msg.to.id.."`\n_شناسه شما :_ `"..msg.from.id.."`", 1, 'md')
            end
        end
   end
   tdcli_function ({
    ID = "GetUserProfilePhotos",
    user_id_ = msg.from.id,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)
end
if msg.reply_id and not matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] and is_mod(msg) then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
if ((matches[1] == "pin" and not Clang) or (matches[1] == "سنجاق" and Clang)) and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "Mᴇssᴀɢᴇ Hᴀs Bᴇᴇɴ #Pɪɴɴᴇᴅ ✓\n#B̸y̸ ❯❯ @"..check_markdown(msg.from.username or '')..""
elseif lang then
return "پیام شما #باموفقیت سجاق شد✓"
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "Mᴇssᴀɢᴇ Hᴀs Bᴇᴇɴ #Pɪɴɴᴇᴅ ✓"
elseif lang then
return "پیام شما #باموفقیت سنجاق شد✓"
end
end
end
if ((matches[1] == 'unpin' and not Clang) or (matches[1] == "حذف سنجاق" and Clang)) and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "Pɪɴ ᴍᴇssᴀɢᴇ ʜᴀs ʙᴇᴇɴ #ᴜɴᴘɪɴɴᴇᴅ ✓"
elseif lang then
return "پیام سنجاق شده شما #باموفقیت پاک شد✓"
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "Pɪɴ ᴍᴇssᴀɢᴇ ʜᴀs ʙᴇᴇɴ #ᴜɴᴘɪɴɴᴇᴅ ✓"
elseif lang then
return "پیام سنجاق شده شما #باموفقیت پاک شد✓"
end
end
end
if ((matches[1]:lower() == "whitelist" and not Clang) or (matches[1] == "لیست سفید" and Clang)) and matches[2] == "+" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="setwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="setwhitelist"})
      end
   end
if ((matches[1]:lower() == "whitelist" and not Clang) or (matches[1] == "لیست سفید" and Clang)) and matches[2] == "-" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="remwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="remwhitelist"})
      end
   end
if ((matches[1] == "setowner" and not Clang) or (matches[1] == 'مالک' and Clang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setowner"})
      end
   end
if ((matches[1] == "remowner" and not Clang) or (matches[1] == "حذف مالک" and Clang)) and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remowner"})
      end
   end
if ((matches[1] == "promote" and not Clang) or (matches[1] == "مدیر" and Clang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="promote"})
      end
   end
if ((matches[1] == "demote" and not Clang) or (matches[1] == "حذف مدیر" and Clang)) and is_owner(msg) then
if not matches[2] and msg.reply_id then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="demote"})
      end
   end

if ((matches[1] == "lock" and not Clang) or (matches[1] == "قفل" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "link" and not Clang) or (matches[2] == "لینک" and Clang)) then
return lock_link(msg, data, target)
end
if ((matches[2] == "tag" and not Clang) or (matches[2] == "تگ" and Clang)) then
return lock_tag(msg, data, target)
end
if ((matches[2] == "mention" and not Clang) or (matches[2] == "فراخوانی" and Clang)) then
return lock_mention(msg, data, target)
end
if ((matches[2] == "arabic" and not Clang) or (matches[2] == "عربی" and Clang)) then
return lock_arabic(msg, data, target)
end
if ((matches[2] == "edit" and not Clang) or (matches[2] == "ویرایش" and Clang)) then
return lock_edit(msg, data, target)
end
if ((matches[2] == "spam" and not Clang) or (matches[2] == "هرزنامه" and Clang)) then
return lock_spam(msg, data, target)
end
if ((matches[2] == "flood" and not Clang) or (matches[2] == "پیام مکرر" and Clang)) then
return lock_flood(msg, data, target)
end
if ((matches[2] == "bots" and not Clang) or (matches[2] == "ربات" and Clang)) then
return lock_bots(msg, data, target)
end
if ((matches[2] == "markdown" and not Clang) or (matches[2] == "فونت" and Clang)) then
return lock_markdown(msg, data, target)
end
if ((matches[2] == "webpage" and not Clang) or (matches[2] == "وب" and Clang)) then
return lock_webpage(msg, data, target)
end
if ((matches[2] == "pin" and not Clang) or (matches[2] == "سنجاق" and Clang)) and is_owner(msg) then
return lock_pin(msg, data, target)
end
if ((matches[2] == "join" and not Clang) or (matches[2] == "ورود" and Clang)) then
return lock_join(msg, data, target)
end
end

if ((matches[1] == "unlock" and not Clang) or (matches[1] == "باز کردن" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "link" and not Clang) or (matches[2] == "لینک" and Clang)) then
return unlock_link(msg, data, target)
end
if ((matches[2] == "tag" and not Clang) or (matches[2] == "تگ" and Clang)) then
return unlock_tag(msg, data, target)
end
if ((matches[2] == "mention" and not Clang) or (matches[2] == "فراخوانی" and Clang)) then
return unlock_mention(msg, data, target)
end
if ((matches[2] == "arabic" and not Clang) or (matches[2] == "عربی" and Clang)) then
return unlock_arabic(msg, data, target)
end
if ((matches[2] == "edit" and not Clang) or (matches[2] == "ویرایش" and Clang)) then
return unlock_edit(msg, data, target)
end
if ((matches[2] == "spam" and not Clang) or (matches[2] == "هرزنامه" and Clang)) then
return unlock_spam(msg, data, target)
end
if ((matches[2] == "flood" and not Clang) or (matches[2] == "پیام مکرر" and Clang)) then
return unlock_flood(msg, data, target)
end
if ((matches[2] == "bots" and not Clang) or (matches[2] == "ربات" and Clang)) then
return unlock_bots(msg, data, target)
end
if ((matches[2] == "markdown" and not Clang) or (matches[2] == "فونت" and Clang)) then
return unlock_markdown(msg, data, target)
end
if ((matches[2] == "webpage" and not Clang) or (matches[2] == "وب" and Clang)) then
return unlock_webpage(msg, data, target)
end
if ((matches[2] == "pin" and not Clang) or (matches[2] == "سنجاق" and Clang)) and is_owner(msg) then
return unlock_pin(msg, data, target)
end
if ((matches[2] == "join" and not Clang) or (matches[2] == "ورود" and Clang)) then
return unlock_join(msg, data, target)
end
end
if ((matches[1] == "mute" and not Clang) or (matches[1] == "بیصدا" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "all" and not Clang) or (matches[2] == "همه" and Clang)) then
return mute_all(msg, data, target)
end
if ((matches[2] == "gif" and not Clang) or (matches[2] == "تصاویر متحرک" and Clang)) then
return mute_gif(msg, data, target)
end
if ((matches[2] == "text" and not Clang) or (matches[2] == "متن" and Clang)) then
return mute_text(msg ,data, target)
end
if ((matches[2] == "photo" and not Clang) or (matches[2] == "عکس" and Clang)) then
return mute_photo(msg ,data, target)
end
if ((matches[2] == "video" and not Clang) or (matches[2] == "فیلم" and Clang)) then
return mute_video(msg ,data, target)
end
if ((matches[2] == "audio" and not Clang) or (matches[2] == "اهنگ" and Clang)) then
return mute_audio(msg ,data, target)
end
if ((matches[2] == "voice" and not Clang) or (matches[2] == "صدا" and Clang)) then
return mute_voice(msg ,data, target)
end
if ((matches[2] == "sticker" and not Clang) or (matches[2] == "برچسب" and Clang)) then
return mute_sticker(msg ,data, target)
end
if ((matches[2] == "contact" and not Clang) or (matches[2] == "مخاطب" and Clang)) then
return mute_contact(msg ,data, target)
end
if ((matches[2] == "forward" and not Clang) or (matches[2] == "نقل قول" and Clang)) then
return mute_forward(msg ,data, target)
end
if ((matches[2] == "location" and not Clang) or (matches[2] == "موقعیت" and Clang)) then
return mute_location(msg ,data, target)
end
if ((matches[2] == "document" and not Clang) or (matches[2] == "اسناد" and Clang)) then
return mute_document(msg ,data, target)
end
if ((matches[2] == "tgservice" and not Clang) or (matches[2] == "خدمات تلگرام" and Clang)) then
return mute_tgservice(msg ,data, target)
end
if ((matches[2] == "inline" and not Clang) or (matches[2] == "کیبورد شیشه ای" and Clang)) then
return mute_inline(msg ,data, target)
end
if ((matches[2] == "game" and not Clang) or (matches[2] == "بازی" and Clang)) then
return mute_game(msg ,data, target)
end
if ((matches[2] == "keyboard" and not Clang) or (matches[2] == "صفحه کلید" and Clang)) then
return mute_keyboard(msg ,data, target)
end
end

if ((matches[1] == "unmute" and not Clang) or (matches[1] == "باصدا" and Clang)) and is_mod(msg) then
local target = msg.to.id
if ((matches[2] == "all" and not Clang) or (matches[2] == "همه" and Clang)) then
return unmute_all(msg, data, target)
end
if ((matches[2] == "gif" and not Clang) or (matches[2] == "تصاویر متحرک" and Clang)) then
return unmute_gif(msg, data, target)
end
if ((matches[2] == "text" and not Clang) or (matches[2] == "متن" and Clang)) then
return unmute_text(msg, data, target)
end
if ((matches[2] == "photo" and not Clang) or (matches[2] == "عکس" and Clang)) then
return unmute_photo(msg ,data, target)
end
if ((matches[2] == "video" and not Clang) or (matches[2] == "فیلم" and Clang)) then
return unmute_video(msg ,data, target)
end
if ((matches[2] == "audio" and not Clang) or (matches[2] == "اهنگ" and Clang)) then
return unmute_audio(msg ,data, target)
end
if ((matches[2] == "voice" and not Clang) or (matches[2] == "صدا" and Clang)) then
return unmute_voice(msg ,data, target)
end
if ((matches[2] == "sticker" and not Clang) or (matches[2] == "برچسب" and Clang)) then
return unmute_sticker(msg ,data, target)
end
if ((matches[2] == "contact" and not Clang) or (matches[2] == "مخاطب" and Clang)) then
return unmute_contact(msg ,data, target)
end
if ((matches[2] == "forward" and not Clang) or (matches[2] == "نقل قول" and Clang)) then
return unmute_forward(msg ,data, target)
end
if ((matches[2] == "location" and not Clang) or (matches[2] == "موقعیت" and Clang)) then
return unmute_location(msg ,data, target)
end
if ((matches[2] == "document" and not Clang) or (matches[2] == "اسناد" and Clang)) then
return unmute_document(msg ,data, target)
end
if ((matches[2] == "tgservice" and not Clang) or (matches[2] == "خدمات تلگرام" and Clang)) then
return unmute_tgservice(msg ,data, target)
end
if ((matches[2] == "inline" and not Clang) or (matches[2] == "کیبورد شیشه ای" and Clang)) then
return unmute_inline(msg ,data, target)
end
if ((matches[2] == "game" and not Clang) or (matches[2] == "بازی" and Clang)) then
return unmute_game(msg ,data, target)
end
if ((matches[2] == "keyboard" and not Clang) or (matches[2] == "صفحه کلید" and Clang)) then
return unmute_keyboard(msg ,data, target)
end
end
if ((matches[1] == "gpinfo" and not Clang) or (matches[1] == "اطلاعات گروه" and Clang)) and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*Group Info :*\n_Admin Count :_ *"..data.administrator_count_.."*\n_Member Count :_ *"..data.member_count_.."*\n_Kicked Count :_ *"..data.kicked_count_.."*\n_Group ID :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
elseif lang then
ginfo = "*اطلاعات گروه :*\n_تعداد مدیران :_ *"..data.administrator_count_.."*\n_تعداد اعضا :_ *"..data.member_count_.."*\n_تعداد اعضای حذف شده :_ *"..data.kicked_count_.."*\n_شناسه گروه :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if ((matches[1] == 'newlink' and not Clang) or (matches[1] == "لینک جدید" and Clang)) and is_mod(msg) then
			local function callback_link (arg, data)
   local hash = "gp_lang:"..msg.to.id
   local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data) 
				if not data.invite_link_ then
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bot is not group creator_\n_set a link for group with using_ /setlink"..msg_caption, 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_ربات سازنده گروه نیست_\n_با دستور_ setlink/ _لینک جدیدی برای گروه ثبت کنید_"..msg_caption, 1, 'md')
    end
				else
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*Newlink Created*", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_لینک جدید ساخته شد_", 1, 'md')
            end
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if ((matches[1] == 'setlink' and not Clang) or (matches[1] == "تنظیم لینک" and Clang)) and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
			return '_Please send the new group_ *link* _now_'
    else 
         return 'لطفا لینک گروه خود را ارسال کنید'
       end
		end

		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
            if not lang then
				return "*Newlink* _has been set_"
           else
           return "لینک جدید ذخیره شد"
		 	end
       end
		end
    if ((matches[1] == 'link' and not Clang) or (matches[1] == "لینک" and Clang)) and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_First create a link for group with using_ /newlink\n_If bot not group creator set a link with using_ /setlink"
     else
        return "ابتدا با دستور newlink/ لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ لینک جدیدی برای گروه ثبت کنید"
      end
      end
     if not lang then
       text = "<b>Group Link :</b>\n"..linkgp..msg_caption
     else
      text = "<b>لینک گروه :</b>\n"..linkgp..msg_caption
         end
        return tdcli.sendMessage(chat, msg.id, 1, text, 1, 'html')
     end
    if ((matches[1] == 'linkpv' and not Clang) or (matches[1] == "لینک خصوصی" and Clang)) and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_First create a link for group with using_ /newlink\n_If bot not group creator set a link with using_ /setlink"
     else
        return "ابتدا با دستور newlink/ لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ لینک جدیدی برای گروه ثبت کنید"
      end
      end
     if not lang then
     tdcli.sendMessage(user, "", 1, "<b>Group Link "..msg.to.title.." :</b>\n"..linkgp..msg_caption, 1, 'html')
     else
      tdcli.sendMessage(user, "", 1, "<b>لینک گروه "..msg.to.title.." :</b>\n"..linkgp..msg_caption, 1, 'html')
         end
      if not lang then
        return "*Group Link Was Send In Your Private Message*"
       else
        return "_لینک گروه به چت خصوصی شما ارسال شد_"
        end
     end
  if ((matches[1] == "setrules" and not Clang) or (matches[1] == "تنظیم قوانین" and Clang)) and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*Group rules* _has been set_"
   else 
  return "قوانین گروه ثبت شد"
   end
  end
  if ((matches[1] == "rules" and not Clang) or (matches[1] == "قوانین" and Clang)) then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban."..msg_caption
    elseif lang then
       rules = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود."..msg_caption
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if ((matches[1] == "res" and not Clang) or (matches[1] == "کاربری" and Clang)) and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="res"})
  end
if ((matches[1] == "whois" and not Clang) or (matches[1] == "شناسه" and Clang)) and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="whois"})
  end
		if ((matches[1]:lower() == 'setchar' and not Clang) or (matches[1] == "حداکثر حروف مجاز" and Clang)) then
			if not is_mod(msg) then
				return
			end
			local chars_max = matches[2]
			data[tostring(msg.to.id)]['settings']['set_char'] = chars_max
			save_data(_config.moderation.data, data)
    if not lang then
     return "*Character sensitivity* _has been set to :_ *[ "..matches[2].." ]*"
   else
     return "_حداکثر حروف مجاز در پیام تنظیم شد به :_ *[ "..matches[2].." ]*"
		end
  end
  if ((matches[1]:lower() == 'setflood' and not Clang) or (matches[1] == "تنظیم پیام مکرر" and Clang)) and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 50 then
				return "_Wrong number, range is_ *[2-50]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "_Group_ *flood* _sensitivity has been set to :_ *[ "..matches[2].." ]*"
    else
    return '_محدودیت پیام مکرر به_ *'..tonumber(matches[2])..'* _تنظیم شد._'
    end
       end
  if ((matches[1]:lower() == 'setfloodtime' and not Clang) or (matches[1] == "تنظیم زمان بررسی" and Clang)) and is_mod(msg) then
			if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 10 then
				return "_Wrong number, range is_ *[2-10]*"
      end
			local time_max = matches[2]
			data[tostring(chat)]['settings']['time_check'] = time_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "_Group_ *flood* _check time has been set to :_ *[ "..matches[2].." ]*"
    else
    return "_حداکثر زمان بررسی پیام های مکرر تنظیم شد به :_ *[ "..matches[2].." ]*"
    end
       end
		if ((matches[1]:lower() == 'clean' and not Clang) or (matches[1] == "پاک کردن" and Clang)) and is_owner(msg) then
			if ((matches[2] == 'mods' and not Clang) or (matches[2] == "مدیران" and Clang)) then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
					return "_No_ *moderators* _in this group_"
             else
                return "هیچ مدیری برای گروه انتخاب نشده است"
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "_All_ *moderators* _has been demoted_"
          else
            return "تمام مدیران گروه تنزیل مقام شدند"
			end
         end
			if ((matches[2] == 'filterlist' and not Clang) or (matches[2] == "لیست فیلتر" and Clang)) then
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
					return "*Filtered words list* _is empty_"
         else
					return "_لیست کلمات فیلتر شده خالی است_"
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
				return "*Filtered words list* _has been cleaned_"
           else
				return "_لیست کلمات فیلتر شده پاک شد_"
           end
			end
			if ((matches[2] == 'rules' and not Clang) or (matches[2] == "قوانین" and Clang)) then
				if not data[tostring(chat)]['rules'] then
            if not lang then
					return "_No_ *rules* _available_"
             else
               return "قوانین برای گروه ثبت نشده است"
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "*Group rules* _has been cleaned_"
          else
            return "قوانین گروه پاک شد"
			end
       end
			if ((matches[2] == 'welcome' and not Clang) or (matches[2] == "خوشامد" and Clang)) then
				if not data[tostring(chat)]['setwelcome'] then
            if not lang then
					return "*Welcome Message not set*"
             else
               return "پیام خوشآمد گویی ثبت نشده است"
             end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
				return "*Welcome message* _has been cleaned_"
          else
            return "پیام خوشآمد گویی پاک شد"
			end
       end
			if ((matches[2] == 'about' and not Clang) or (matches[2] == "درباره" and Clang)) then
        if msg.to.type == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
					return "_No_ *description* _available_"
            else
              return "پیامی مبنی بر درباره گروه ثبت نشده است"
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
				return "*Group description* _has been cleaned_"
           else
              return "پیام مبنی بر درباره گروه پاک شد"
             end
		   	end
        end
		if ((matches[1]:lower() == 'clean' and not Clang) or (matches[1] == "پاک کردن" and Clang)) and is_admin(msg) then
			if ((matches[2] == 'owners' and not Clang) or (matches[2] == "مالکان" and Clang)) then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
					return "_No_ *owners* _in this group_"
            else
                return "مالکی برای گروه انتخاب نشده است"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
				return "_All_ *owners* _has been demoted_"
           else
            return "تمامی مالکان گروه تنزیل مقام شدند"
          end
			end
     end
if ((matches[1] == "setname" and not Clang) or (matches[1] == "تنظیم نام" and Clang)) and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if ((matches[1] == "setabout" and not Clang) or (matches[1] == "تنظیم درباره" and Clang)) and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*Group description* _has been set_"
    else
     return "پیام مبنی بر درباره گروه ثبت شد"
      end
  end
  if ((matches[1] == "about" and not Clang) or (matches[1] == "درباره" and Clang)) and msg.to.type == "chat" and is_owner(msg) then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_No_ *description* _available_"
      elseif lang then
      about = "پیامی مبنی بر درباره گروه ثبت نشده است"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if ((matches[1] == 'filter' and not Clang) or (matches[1] == "فیلتر" and Clang)) and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if ((matches[1] == 'unfilter' and not Clang) or (matches[1] == "حذف فیلتر" and Clang)) and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if ((matches[1] == 'filterlist' and not Clang) or (matches[1] == "لیست فیلتر" and Clang)) and is_mod(msg) then
    return filter_list(msg)
  end
if ((matches[1] == "settings" and not Clang) or (matches[1] == "تنظیمات" and Clang)) and is_mod(msg) then
return group_settings(msg, target)
end
if ((matches[1] == "mutelist" and not Clang) or (matches[1] == "لیست بیصدا" and Clang)) and is_mod(msg) then
return mutes(msg, target)
end
if ((matches[1] == "modlist" and not Clang) or (matches[1] == "لیست مدیران" and Clang)) and is_mod(msg) then
return modlist(msg)
end
if ((matches[1] == "ownerlist" and not Clang) or (matches[1] == "لیست مالکان" and Clang)) and is_owner(msg) then
return ownerlist(msg)
end
if ((matches[1] == "whitelist" and not Clang) or (matches[1] == "لیست سفید" and Clang)) and not matches[2] and is_mod(msg) then
return whitelist(msg.to.id)
end

if ((matches[1]:lower() == "panel" and not Clang) or (matches[1] == "پنل" and Clang)) and is_mod(msg) then
local function found_helper(TM, Beyond)
local function inline_query_cb(TM, BD)
      if BD.results_ and BD.results_[0] then
		tdcli.sendInlineQueryResultMessage(msg.to.id, 0, 0, 1, BD.inline_query_id_, BD.results_[0].id_, dl_cb, nil)
    else
    if not lang then
    text = "✦E̸r̸o̸r̸r̸✦ \n❂➤ H̸e̸l̸p̸e̸r̸ i̸s̸ o̸f̸f̸l̸i̸n̸e̸ :(\n\n"
        elseif lang then
    text = "_ربات هلپر خاموش است_\n\n"
    end
  return tdcli.sendMessage(msg.to.id, msg.id, 0, text, 0, "md")
   end
end
tdcli.getInlineQueryResults(Beyond.id_, msg.to.id, 0, 0, msg.to.id, 0, inline_query_cb, nil)
end
tdcli.searchPublicChat(tostring(helper_username), found_helper, nil)
end

if (matches[1]:lower() == "setlang" and not Clang) and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
if matches[2] == "fa" then
redis:set(hash, true)
return "*زبان گروه تنظیم شد به : فارسی*"..msg_caption
  elseif matches[2] == "en" then
 redis:del(hash)
return "*✦Done!*\n ❂➤ G̸r̸o̸u̸p̸ L̸a̸n̸g̸u̸a̸g̸e̸ S̸e̸t̸ T̸o̸: *E̸N̸*"..msg_caption
end
end
if (matches[1] == 'زبان' and Clang) and is_owner(msg) then
local hash = "gp_lang:"..msg.to.id
if matches[2] == "فارسی" then
redis:set(hash, true)
return "*زبان گروه تنظیم شد به : فارسی*"..msg_caption
  elseif matches[2] == "انگلیسی" then
 redis:del(hash)
return "*✦Done!*\n ❂➤ G̸r̸o̸u̸p̸ L̸a̸n̸g̸u̸a̸g̸e̸ S̸e̸t̸ T̸o̸: *E̸N̸*"..msg_caption
end
end

if (matches[1]:lower() == "setcmd" and not Clang) and is_owner(msg) then
local hash = "cmd_lang:"..msg.to.id
if matches[2] == "fa" then
redis:set(hash, true)
   if lang then
return "*زبان دستورات ربات تنظیم شد به : فارسی*"..msg_caption
else
return "*✦Done!*\n ❂➤ B̸o̸t̸ C̸o̸m̸m̸a̸n̸d̸s̸ L̸a̸n̸g̸u̸a̸g̸e̸ S̸e̸t̸ T̸o̸:* F̸a̸*"..msg_caption
end
end
end

if (matches[1]:lower() == "دستورات انگلیسی" and Clang) and is_owner(msg) then
local hash = "cmd_lang:"..msg.to.id
redis:del(hash)
   if lang then
return "*زبان دستورات ربات تنظیم شد به : انگلیسی*"..msg_caption
else
return "*✦Done!*\n ❂➤ B̸o̸t̸ C̸o̸m̸m̸a̸n̸d̸s̸ L̸a̸n̸g̸u̸a̸g̸e̸ S̸e̸t̸ T̸o̸: *E̸N̸*"..msg_caption
end
end

if (matches[1] == "help" and not Clang) and is_mod(msg) then
if not lang then
text = [[
کاربر گرامـي توجہ داشته باشید که براے رفتن به بخش ها می بایست کلمه زیر بخش دلخواه را ارسال کنید
—--راهنماے کُلی---
✯بخش ❶
✷`راهنماے قفل ها`
✯بخش ❷
✷`راهنماے بیصدا ها`
✯بخش ❸
✷`راهنماے مدیران`
✯بخش ❹
✷`راهنماے پاکسازے`
✯بخش ❺
✷`راهنماے اعضا`
✯بخش ❻
✷`راهنماے بازاریابے`
✯بخش ❼
✷`راهنماے سرگرمی`
✯بخش ❽
✷`راهنماے پشتیبانی`
✯بخش ❾
✷`انواع لیست ها`
✯بخش ❿
✷`راهنماے مُدیر ربات]]

elseif lang then

text = [[
کاربر گرامـي توجہ داشته باشید که براے رفتن به بخش ها می بایست کلمه زیر بخش دلخواه را ارسال کنید
—--راهنماے کُلی---
✯بخش ❶
✷`راهنماے قفل ها`
✯بخش ❷
✷`راهنماے بیصدا ها`
✯بخش ❸
✷`راهنماے مدیران`
✯بخش ❹
✷`راهنماے پاکسازے`
✯بخش ❺
✷`راهنماے اعضا`
✯بخش ❻
✷`راهنماے بازاریابے`
✯بخش ❼
✷`راهنماے سرگرمی`
✯بخش ❽
✷`راهنماے پشتیبانی`
✯بخش ❾
✷`انواع لیست ها`
✯بخش ❿
✷`راهنماے مُدیر ربات
]]
end
return text..msg_caption
end

if (matches[1] == "راهنما" and Clang) and is_mod(msg) then
if not lang then
text = [[
کاربر گرامـي توجہ داشته باشید که براے رفتن به بخش ها می بایست کلمه زیر بخش دلخواه را ارسال کنید
—--راهنماے کُلی---
✯بخش ❶
✷`راهنماے قفل ها`
✯بخش ❷
✷`راهنماے بیصدا ها`
✯بخش ❸
✷`راهنماے مدیران`
✯بخش ❹
✷`راهنماے پاکسازے`
✯بخش ❺
✷`راهنماے اعضا`
✯بخش ❻
✷`راهنماے بازاریابے`
✯بخش ❼
✷`راهنماے سرگرمی`
✯بخش ❽
✷`راهنماے پشتیبانی`
✯بخش ❾
✷`انواع لیست ها`
✯بخش ❿
✷`راهنماے مُدیر ربات]]

elseif lang then

text = [[
کاربر گرامـي توجہ داشته باشید که براے رفتن به بخش ها می بایست کلمه زیر بخش دلخواه را ارسال کنید
—--راهنماے کُلی---
✯بخش ❶
✷`راهنماے قفل ها`
✯بخش ❷
✷`راهنماے بیصدا ها`
✯بخش ❸
✷`راهنماے مدیران`
✯بخش ❹
✷`راهنماے پاکسازے`
✯بخش ❺
✷`راهنماے اعضا`
✯بخش ❻
✷`راهنماے بازاریابے`
✯بخش ❼
✷`راهنماے سرگرمی`
✯بخش ❽
✷`راهنماے پشتیبانی`
✯بخش ❾
✷`انواع لیست ها`
✯بخش ❿
✷`راهنماے مُدیر ربات]]
end
return text..msg_caption
end
--------------------- Welcome -----------------------
	if ((matches[1] == "welcome" and not Clang) or (matches[1] == "خوشامد" and Clang)) and is_mod(msg) then
		if ((matches[2] == "enable" and not Clang) or (matches[2] == "فعال" and Clang)) then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
       if not lang then
				return "G̸r̸o̸u̸p̸ *w̸e̸l̸c̸o̸m̸e̸* i̸s̸ a̸l̸r̸e̸a̸d̸y̸ e̸n̸a̸b̸l̸e̸d̸"
       elseif lang then
				return "_خوشآمد گویی از قبل فعال بود_"
           end
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
       if not lang then
				return "G̸r̸o̸u̸p̸ *w̸e̸l̸c̸o̸m̸e̸* h̸a̸s̸ b̸e̸e̸n̸ e̸n̸a̸b̸l̸e̸d̸"
       elseif lang then
				return "_خوشآمد گویی فعال شد_"
          end
			end
		end
		
		if ((matches[2] == "disable" and not Clang) or (matches[2] == "غیرفعال" and Clang)) then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
      if not lang then
				return "G̸r̸o̸u̸p̸ *W̸e̸l̸c̸o̸m̸e̸* i̸s̸ a̸l̸r̸e̸a̸d̸y̸ d̸i̸s̸a̸b̸l̸e̸d̸"
      elseif lang then
				return "_خوشآمد گویی از قبل فعال نبود_"
         end
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
      if not lang then
				return "G̸r̸o̸u̸p̸ *w̸e̸l̸c̸o̸m̸e̸* h̸a̸s̸ b̸e̸e̸n̸ d̸i̸s̸a̸b̸l̸e̸d̸✓"
      elseif lang then
				return "_✓خوشآمد گویی غیرفعال شد_"
          end
			end
		end
	end
	if ((matches[1] == "setwelcome" and not Clang) or (matches[1] == "تنظیم خوشامد" and Clang)) and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "W̸e̸l̸c̸o̸m̸e̸ M̸e̸s̸s̸a̸g̸e̸ H̸a̸s̸ B̸e̸e̸n̸ S̸e̸t̸ T̸o̸ :\n`[*"..matches[2].."*]`\n\nY̸o̸u̸ c̸a̸n̸ u̸s̸e̸ :\n̸{g̸p̸n̸a̸m̸e̸} G̸r̸o̸u̸p̸ N̸a̸m̸e̸\n̸{r̸u̸l̸e̸s̸} ➣ S̸h̸o̸w̸ G̸r̸o̸u̸p̸ R̸u̸l̸e̸s̸\n̸{t̸i̸m̸e̸} ➣ S̸h̸o̸w̸ t̸i̸m̸e̸ e̸n̸g̸l̸i̸s̸h̸ \n̸{d̸a̸t̸e̸} ➣ S̸h̸o̸w̸ d̸a̸t̸e̸ e̸n̸g̸l̸i̸s̸h̸ \n̸{t̸i̸m̸e̸f̸a̸} ➣ S̸h̸o̸w̸ t̸i̸m̸e̸ p̸e̸r̸s̸i̸a̸n̸ \n̸{d̸a̸t̸e̸f̸a̸} ➣ s̸h̸o̸w̸ d̸a̸t̸e̸ p̸e̸r̸s̸i̸a̸n̸ \n̸{n̸a̸m̸e̸} ➣ N̸e̸w̸ M̸e̸m̸b̸e̸r̸ F̸i̸r̸s̸t̸ N̸a̸m̸e̸\n̸{u̸s̸e̸r̸n̸a̸m̸e̸} ➣ N̸e̸w̸ M̸e̸m̸b̸e̸r̸ U̸s̸e̸r̸n̸a̸m̸e̸"..msg_caption
       else
		return "_پیام خوشآمد گویی تنظیم شد به :_\n*"..matches[2].."*\n\n*شما میتوانید از*\n_{gpname} نام گروه_\n_{rules} ➣ نمایش قوانین گروه_\n_{time} ➣ ساعت به زبان انگلیسی _\n_{date} ➣ تاریخ به زبان انگلیسی _\n_{timefa} ➣ ساعت به زبان فارسی _\n_{datefa} ➣ تاریخ به زبان فارسی _\n_{name} ➣ نام کاربر جدید_\n_{username} ➣ نام کاربری کاربر جدید_\n_استفاده کنید_"..msg_caption
        end
     end
	end
end
-----------------------------------------
local checkmod = true

local function pre_process(msg)
local chat = msg.to.id
local user = msg.from.id
local hash = "gp_lang:"..chat
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
 if checkmod and msg.text and msg.to.type == 'channel' then
 	checkmod = false
	tdcli.getChannelMembers(msg.to.id, 0, 'Administrators', 200, function(a, b)
	local secchk = true
		for k,v in pairs(b.members_) do
			if v.user_id_ == tonumber(our_id) then
				secchk = false
			end
		end
		if secchk then
			checkmod = false
			if not lang then
				return tdcli.sendMessage(msg.to.id, 0, 1, '➲ R̸o̸b̸o̸t̸ i̸s̸n̸\'t̸ A̸d̸m̸i̸n̸i̸s̸t̸r̸a̸t̸o̸r̸, P̸l̸e̸a̸s̸e̸ P̸r̸o̸m̸o̸t̸e̸ t̸o̸ A̸d̸m̸i̸n̸!✘', 1, "md")
			else
				return tdcli.sendMessage(msg.to.id, 0, 1, '_لطفا برای کارکرد کامل دستورات، ربات را به #مدیر گروه ارتقا دهید._', 1, "md")
			end
		end
	end, nil)
 end
	local function welcome_cb(arg, data)
	local url , res = http.request('http://irapi.ir/time/')
          if res ~= 200 then return "No connection" end
      local jdat = json:decode(url)
		administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "W̸e̸l̸c̸o̸m̸e̸ D̸u̸d̸e̸🌹"
    elseif lang then
     welcome = "🌹خوش آمدید"
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban.\n@LockerTeam"
    elseif lang then
       rules = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود.\n@LockerTeam"
 end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_..' '..(data.last_name_ or '')))
		local welcome = welcome:gsub("{username}", user_name)
		local welcome = welcome:gsub("{time}", jdat.ENtime)
		local welcome = welcome:gsub("{date}", jdat.ENdate)
		local welcome = welcome:gsub("{timefa}", jdat.FAtime)
		local welcome = welcome:gsub("{datefa}", jdat.FAdate)
		local welcome = welcome:gsub("{gpname}", arg.gp_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.adduser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.getUser(msg.adduser, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
		end
	end
	if msg.joinuser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli.getUser(msg.sender_user_id_, welcome_cb, {chat_id=chat,msg_id=msg.id_,gp_name=msg.to.title})
		else
			return false
        end
		end
	end

 end
 
return {
patterns ={
"^[!/#](me)$",
"^[!/#](me) (.*)$",
"^[!/#](pin)$",
"^[!/#](unpin)$",
"^[!/#](gpinfo)$",
"^[!/#](test)$",
"^[!/#](add)$",
"^[!/#](rem)$",
"^[!/#](panel)$",
"^[!/#](whitelist) ([+-])$",
"^[!/#](whitelist) ([+-]) (.*)$",
"^[#!/](whitelist)$",
"^[!/#](setowner)$",
"^[!/#](setowner) (.*)$",
"^[!/#](remowner)$",
"^[!/#](remowner) (.*)$",
"^[!/#](promote)$",
"^[!/#](promote) (.*)$",
"^[!/#](demote)$",
"^[!/#](demote) (.*)$",
"^[!/#](modlist)$",
"^[!/#](ownerlist)$",
"^[!/#](lock) (.*)$",
"^[!/#](unlock) (.*)$",
"^[!/#](settings)$",
"^[!/#](mutelist)$",
"^[!/#](mute) (.*)$",
"^[!/#](unmute) (.*)$",
"^[!/#](link)$",
"^[!/#](linkpv)$",
"^[!/#](setlink)$",
"^[!/#](newlink)$",
"^[!/#](rules)$",
"^[!/#](setrules) (.*)$",
"^[!/#](about)$",
"^[!/#](setabout) (.*)$",
"^[!/#](setname) (.*)$",
"^[!/#](clean) (.*)$",
"^[!/#](setflood) (%d+)$",
"^[!/#](setchar) (%d+)$",
"^[!/#](setfloodtime) (%d+)$",
"^[!/#](res) (.*)$",
"^[!/#](whois) (%d+)$",
"^[!/#](help)$",
"^[!/#](setlang) (.*)$",
"^[!/#](setcmd) (.*)$",
"^[#!/](filter) (.*)$",
"^[#!/](unfilter) (.*)$",
"^[#!/](filterlist)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^[!/#](setwelcome) (.*)",
"^[!/#](welcome) (.*)$",
"^(زبان) (.*)$",
"^(دستورات انگلیسی)$",
"^(من)$",
"^(من) (.*)$",
'^(تنظیمات)$',
'^(پنل)$',
'^(سنجاق)$',
'^(حذف سنجاق)$',
'^(نصب)$',
'^(حذف گروه)$',
'^(ادمین گروه)$',
'^(ادمین گروه) (.*)$',
'^(حذف ادمین گروه) (.*)$',
'^(حذف ادمین گروه)$',
'^(لیست سفید) ([+-]) (.*)$',
'^(لیست سفید) ([+-])$',
'^(لیست سفید)$',
'^(مالک)$',
'^(مالک) (.*)$',
'^(حذف مالک) (.*)$',
'^(حذف مالک)$',
'^(مدیر)$',
'^(مدیر) (.*)$',
'^(حذف مدیر)$',
'^(حذف مدیر) (.*)$',
'^(قفل) (.*)$',
'^(باز کردن) (.*)$',
'^(بیصدا) (.*)$',
'^(باصدا) (.*)$',
'^(لینک جدید)$',
'^(لینک جدید) (خصوصی)$',
'^(اطلاعات گروه)$',
'^(دستورات) (.*)$',
'^(قوانین)$',
'^(لینک)$',
'^(تنظیم لینک)$',
'^(تنظیم قوانین) (.*)$',
'^(لینک) (خصوصی)$',
'^(کاربری) (.*)$',
'^(شناسه) (%d+)$',
'^(تنظیم پیام مکرر) (%d+)$',
'^(تنظیم زمان بررسی) (%d+)$',
'^(حداکثر حروف مجاز) (%d+)$',
'^(پاک کردن) (.*)$',
'^(درباره)$',
'^(تنظیم نام) (.*)$',
'^(تنظیم درباره) (.*)$',
'^(لیست فیلتر)$',
'^(لیست بیصدا)$',
'^(لیست مالکان)$',
'^(لیست مدیران)$',
'^(راهنما)$',
'^(فیلتر) (.*)$',
'^(حذف فیلتر) (.*)$',
'^(خوشامد) (.*)$',
'^(تنظیم خوشامد) (.*)$',


},
run=run,
pre_process = pre_process
}
--end groupmanager.lua #Locker team#
-----EDIT-----By-----#@SudoLocker
