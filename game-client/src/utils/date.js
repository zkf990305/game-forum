export function formatDate(timestamp) {
  const arrTimestamp = (timestamp + "").split("");
  for (let start = 0; start < 13; start++) {
    if (!arrTimestamp[start]) {
      arrTimestamp[start] = "0";
    }
  }
  timestamp = arrTimestamp.join("") * 1;
  const minute = 1000 * 60;
  const hour = minute * 60;
  const day = hour * 24;
  const month = day * 30;
  const now = new Date().getTime();
  const diffValue = now - timestamp;
  if (diffValue < 0) {
    return "不久前";
  }
  const monthC = diffValue / month;
  const weekC = diffValue / (7 * day);
  const dayC = diffValue / day;
  const hourC = diffValue / hour;
  const minC = diffValue / minute;
  const zero = function(value) {
    if (value < 10) {
      return "0" + value;
    }
    return value;
  };
  if (monthC > 4) {
    return (function() {
      const date = new Date(timestamp);
      return (
        date.getFullYear() +
        "年" +
        zero(date.getMonth() + 1) +
        "月" +
        zero(date.getDate()) +
        "日"
      );
    })();
  } else if (monthC >= 1) {
    return parseInt(monthC) + "月前";
  } else if (weekC >= 1) {
    return parseInt(weekC) + "周前";
  } else if (dayC >= 1) {
    return parseInt(dayC) + "天前";
  } else if (hourC >= 1) {
    return parseInt(hourC) + "小时前";
  } else if (minC >= 1) {
    return parseInt(minC) + "分钟前";
  }
  return "刚刚";
}
