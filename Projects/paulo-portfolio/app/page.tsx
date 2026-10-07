import HeroSection from "@/components/HeroSection"
import AboutSection from "@/components/AboutSection"
import ProjectsSection from "@/components/ProjectsSection"
import GallerySection from "@/components/GallerySection"
import RecruiterSection from "@/components/RecruiterSection"

export default function Home() {
  return (
    <main className="mx-auto max-w-5xl px-4 sm:px-6">
      <HeroSection />
      <AboutSection />
      <ProjectsSection />
      <GallerySection />
      <RecruiterSection />
    </main>
  )
}
