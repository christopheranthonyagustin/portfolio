"use client"
import { useState } from "react"
import { Link } from "react-scroll/modules"
import { useTheme } from "next-themes"
import { RiMoonFill, RiSunLine } from "react-icons/ri"
import { IoMdMenu, IoMdClose } from "react-icons/io"

const NAV_ITEMS = [
  { label: "Home", page: "home" },
  { label: "About", page: "about" },
  { label: "Projects", page: "projects" },
  { label: "Gallery", page: "gallery" },
  { label: "Contact", page: "contact" },
]

export default function Navbar() {
  const { systemTheme, theme, setTheme } = useTheme()
  const currentTheme = theme === "system" ? systemTheme : theme
  const [navbar, setNavbar] = useState(false)

  return (
    <header className="fixed top-0 z-50 mx-auto w-full bg-white px-4 shadow dark:border-b dark:border-stone-600 dark:bg-stone-900 sm:px-20">
      <div className="justify-between md:flex md:items-center">
        <div className="flex items-center justify-between py-3 md:py-5">
          <Link to="home" smooth duration={500} className="cursor-pointer">
            <h2 className="text-xl font-bold">Ephraim Paulo Hernandez</h2>
          </Link>
          <button className="p-2 md:hidden" onClick={() => setNavbar(!navbar)} aria-label="Toggle navigation">
            {navbar ? <IoMdClose size={30} /> : <IoMdMenu size={30} />}
          </button>
        </div>
        <div className={`${navbar ? "block" : "hidden"} pb-4 md:block md:pb-0`}>
          <div className="items-center justify-center space-y-5 md:flex md:space-x-6 md:space-y-0">
            {NAV_ITEMS.map((item) => (
              <Link key={item.page} to={item.page} className="block cursor-pointer hover:text-neutral-500 md:inline-block" activeClass="active" spy smooth offset={-100} duration={500} onClick={() => setNavbar(false)}>
                {item.label}
              </Link>
            ))}
            <button onClick={() => setTheme(currentTheme === "dark" ? "light" : "dark")} className="rounded-xl bg-slate-100 p-2" aria-label="Toggle theme">
              {currentTheme === "dark" ? <RiSunLine size={22} color="black" /> : <RiMoonFill size={22} />}
            </button>
          </div>
        </div>
      </div>
    </header>
  )
}
