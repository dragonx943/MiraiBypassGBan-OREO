module.exports.config = {
	name: "restart",
	version: "1.0.0",
	hasPermssion: 2,
	credits: "Mirai Team",
	description: "Khởi Động Lại Bot.",
	commandCategory: "system",
	cooldowns: 0
        };
module.exports.run = ({event, api}) =>api.sendMessage("\n\n👾Vui lòng đợi 5-10s để bot khởi động lại hệ thống👾\n\n",event.threadID, () =>process.exit(1))