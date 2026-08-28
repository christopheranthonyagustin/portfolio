export function dateTimeFormatter(
  value: string | Date | null | undefined
): string {

  if (!value) {
    return '';
  }

  const date = value instanceof Date
    ? value
    : new Date(value);

  if (isNaN(date.getTime())) {
    return String(value);
  }

  const language =
    localStorage.getItem('logivis-language') ?? 'en';

  const isChinese =
    language.toLowerCase().startsWith('zh');

  const formatter = new Intl.DateTimeFormat(
    isChinese ? 'zh-CN' : 'en-SG',
    {
      day: '2-digit',
      month: isChinese ? '2-digit' : 'short',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: false,
      timeZone: 'Asia/Singapore'
    }
  );

  const parts = formatter.formatToParts(date);

  const get = (type: Intl.DateTimeFormatPartTypes) =>
    parts.find(p => p.type === type)?.value ?? '';

  if (isChinese) {
    return `${get('year')}年${get('month')}月${get('day')}日 ` +
      `${get('hour')}:${get('minute')}:${get('second')}`;
  }

  return `${get('day')}-${get('month')}-${get('year')} ` +
    `${get('hour')}:${get('minute')}:${get('second')}`;
}
