import "../styles/globals.css"
import Navbar from "@/components/Navbar"
import Footer from "@/components/Footer"
import Providers from "@/components/Providers"

const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || "http://localhost:3000"

export const metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: "Ephraim Paulo Hernandez | Electronic Security Systems",
    template: "%s | Ephraim Paulo Hernandez",
  },
  description:
    "Ephraim Paulo Hernandez is an Electronic Security Systems professional and Technical Shift Manager specializing in CCTV, VMS, surveillance, security infrastructure, systems integration and technical operations.",
  keywords: [
    "Ephraim Paulo Hernandez",
    "Electronic Security Systems",
    "Technical Shift Manager",
    "CCTV",
    "IP CCTV",
    "VMS",
    "Surveillance Systems",
    "Security Infrastructure",
    "Facial Recognition",
    "LPR",
    "ANPR",
    "UVIS",
    "Access Control",
    "Security Systems Integration",
  ],
  authors: [{ name: "Ephraim Paulo Hernandez" }],
  creator: "Ephraim Paulo Hernandez",
  robots: {
    index: true,
    follow: true,
    googleBot: { index: true, follow: true, "max-image-preview": "large" },
  },
  openGraph: {
    type: "website",
    locale: "en_US",
    url: siteUrl,
    title: "Ephraim Paulo Hernandez | Electronic Security Systems",
    description:
      "Electronic Security Systems professional specializing in surveillance, VMS, security infrastructure and systems integration.",
    siteName: "Ephraim Paulo Hernandez Portfolio",
    images: [{ url: "/og-image.svg", width: 1200, height: 630, alt: "Ephraim Paulo Hernandez portfolio" }],
  },
  twitter: {
    card: "summary_large_image",
    title: "Ephraim Paulo Hernandez | Electronic Security Systems",
    description:
      "Electronic Security Systems professional specializing in surveillance, VMS, security infrastructure and systems integration.",
    images: ["/og-image.svg"],
  },
}

const personSchema = {
  "@context": "https://schema.org",
  "@type": "Person",
  name: "Ephraim Paulo Hernandez",
  jobTitle: "Technical Shift Manager",
  description:
    "Electronic Security Systems professional specializing in surveillance, VMS, security infrastructure and systems integration.",
  url: siteUrl,
  email: "epihernandez26@gmail.com",
  sameAs: ["https://www.linkedin.com/in/ephraimpaulohernandez"],
  knowsAbout: [
    "CCTV", "IP CCTV", "Video Management Systems", "Facial Recognition",
    "Access Control", "LPR / ANPR", "Under-Vehicle Inspection",
    "Security Networking", "Electronic Security Systems Integration",
  ],
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className="dark:bg-stone-900 dark:text-neutral-100">
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(personSchema) }}
        />
        <Providers>
          <Navbar />
          {children}
          <Footer />
        </Providers>
      </body>
    </html>
  )
}
