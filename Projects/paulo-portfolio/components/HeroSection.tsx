"use client"
import { Link } from "react-scroll/modules"
import { HiArrowDown } from "react-icons/hi"

export default function HeroSection() {
  return (
    <section id="home">
      <div className="flex flex-col items-center justify-center py-24 text-center md:flex-row md:space-x-12 md:py-40 md:text-left">
        <div className="flex justify-center md:w-2/5">
          <div className="flex h-64 w-64 items-center justify-center rounded-full bg-gradient-to-br from-slate-700 to-slate-900 text-white shadow-2xl md:h-72 md:w-72">
            <div className="text-center"><span className="text-7xl font-bold">EPH</span><p className="mt-2 text-xs uppercase tracking-[0.3em] text-teal-300">Security Systems</p></div>
          </div>
        </div>
        <div className="md:w-3/5">
          <p className="mt-8 text-sm font-semibold uppercase tracking-[0.25em] text-teal-600 md:mt-0">Electronic Security Systems</p>
          <h1 className="mt-3 text-4xl font-bold md:text-6xl">Ephraim Paulo Hernandez</h1>
          <p className="mb-7 mt-5 text-lg md:text-2xl">Technical Shift Manager specializing in <span className="font-semibold text-teal-600">surveillance, VMS and security infrastructure</span>.</p>
          <p className="max-w-xl text-neutral-600 dark:text-neutral-400">Experienced in operating, integrating, troubleshooting and maintaining mission-critical electronic security systems, including environments supporting <strong className="text-teal-600">more than 7,200 CCTV/IP network cameras</strong>.</p>
          <Link to="projects" className="mt-7 inline-block cursor-pointer rounded bg-teal-600 px-6 py-3 font-semibold text-neutral-100 shadow transition hover:bg-teal-700" activeClass="active" spy smooth offset={-100} duration={500}>Explore Projects</Link>
        </div>
      </div>
      <div className="flex justify-center pb-8"><Link to="about" smooth offset={-100} duration={500} className="cursor-pointer"><HiArrowDown size={35} className="animate-bounce" /></Link></div>
    </section>
  )
}
