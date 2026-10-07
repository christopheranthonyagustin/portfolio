export default function RecruiterSection() {
  return (
    <section id="contact" className="py-20">
      <div className="rounded-2xl border border-gray-800 bg-gray-900 p-8 text-center shadow-xl sm:p-12">
        <p className="text-sm font-semibold uppercase tracking-[0.25em] text-teal-500">Professional Opportunities</p>
        <h2 className="mt-3 text-3xl font-bold tracking-tight text-white sm:text-4xl">Recruiters &amp; Hiring Teams</h2>
        <p className="mx-auto mt-6 max-w-3xl text-gray-300">
          If you&apos;re looking for an experienced electronic security systems professional, I&apos;d be glad to connect.
        </p>
        <p className="mx-auto mt-4 max-w-3xl text-gray-400">
          I bring extensive hands-on experience in surveillance systems, VMS platforms, security infrastructure, systems integration, networking, commissioning, and technical operations within complex, high-security environments.
        </p>
        <p className="mx-auto mt-4 max-w-3xl text-gray-400">
          My experience includes supporting and maintaining an environment of more than <strong className="text-white">7,200 CCTV/IP network cameras at Okada Manila</strong>, working across multi-brand VMS and security technologies, and providing technical leadership for surveillance and physical security operations.
        </p>
        <p className="mx-auto mt-4 max-w-3xl text-gray-400">
          <strong className="text-white">View my CV</strong> to learn more about my professional experience, technical capabilities, and the security systems environments I have supported throughout my career.
        </p>
        <div className="mt-8 flex flex-col items-center justify-center gap-4 sm:flex-row">
          <a href="/Hernandez_CV.pdf" download className="rounded-lg bg-teal-600 px-6 py-3 font-semibold text-white transition hover:bg-teal-700">Download CV</a>
          <a href="https://www.linkedin.com/in/ephraimpaulohernandez" target="_blank" rel="noopener noreferrer" className="rounded-lg border border-gray-700 px-6 py-3 font-semibold text-white transition hover:bg-gray-800">View LinkedIn</a>
          <a href="mailto:epihernandez26@gmail.com" className="rounded-lg border border-gray-700 px-6 py-3 font-semibold text-white transition hover:bg-gray-800">Contact Me</a>
        </div>
      </div>
    </section>
  )
}
