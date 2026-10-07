const gallery = [
    {
        image: "/gallery/surveillance.svg",
        title: "Surveillance Systems",
        description: "Large-scale CCTV and IP surveillance environments",
    },
    {
        image: "/gallery/security-infrastructure.svg",
        title: "Security Infrastructure",
        description: "Security infrastructure, network and equipment environments",
    },
    {
        image: "/gallery/system-integration.svg",
        title: "System Integration",
        description: "Integrated security technologies and technical deployments",
    },
    {
        image: "/gallery/technical-operations.svg",
        title: "Technical Operations",
        description: "Technical operations, diagnostics and maintenance",
    },
    {
        image: "/gallery/commissioning.svg",
        title: "Commissioning & Deployment",
        description: "Installation, testing and commissioning activities",
    },
    {
        image: "/gallery/training.svg",
        title: "Training & Professional Development",
        description: "Technical training and professional development",
    },
]

export default function GallerySection() {
    return (
        <section id= "gallery" className = "py-16" >
            <div className="mb-10 text-center" >
                <h2 className="text-4xl font-bold" > Career Highlights </h2>

                    < hr className = "mx-auto my-4 h-1 w-6 rounded border-0 bg-teal-500" />

                        <p className="mx-auto max-w-2xl text-neutral-600 dark:text-neutral-400" >
                            A visual collection of professional environments, technical work,
                                systems integration and career milestones.
        </p>
                                    </div>

                                    < div className = "grid gap-6 sm:grid-cols-2 lg:grid-cols-3" >
                                    {
                                        gallery.map((item) => (
                                            <figure
            key= { item.title }
            className = "group overflow-hidden rounded-xl border border-gray-200 bg-white shadow-lg dark:border-stone-700 dark:bg-stone-900"
                                            >
                                            <img
              src={ item.image }
              alt = { item.title }
              className = "aspect-video w-full object-cover transition duration-500 group-hover:scale-105"
                                            />

                                            <figcaption className="p-5" >
                                        <h3 className="text-lg font-bold" > { item.title } </h3>

                                        < p className = "mt-2 text-sm text-neutral-600 dark:text-neutral-400" >
                                        { item.description }
                                        </p>
                                        </figcaption>
                                        </figure>
                                        ))
                                    }
                                        </div>

                                        < p className = "mt-6 text-center text-xs text-neutral-500" >
                                            Temporary visuals — professional photographs can replace these images
        without changing the gallery layout.
      </p>
        </section>
  )
}