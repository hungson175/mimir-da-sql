import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'Cờ Caro - 5 in a Row',
  description: 'Game cờ caro 5 in a row',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="vi">
      <body>{children}</body>
    </html>
  )
}
