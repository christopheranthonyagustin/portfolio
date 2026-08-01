/**
 * Formats a date using Singapore format:
 * DD-MMM-YYYY HH:mm:ss
 *
 * Example:
 * 01-Aug-2026 18:25:43
 */
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

  const formatter = new Intl.DateTimeFormat('en-SG', {
    day: '2-digit',
    month: 'short',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false,
    timeZone: 'Asia/Singapore'
  });

  const parts = formatter.formatToParts(date);

  const get = (type: Intl.DateTimeFormatPartTypes) =>
    parts.find(p => p.type === type)?.value ?? '';

  return `${get('day')}-${get('month')}-${get('year')} ` +
    `${get('hour')}:${get('minute')}:${get('second')}`;

}
