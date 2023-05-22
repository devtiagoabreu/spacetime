export default function Home() {
  return (
    <main className="grid min-h-screen grid-cols-2">
      {/* LEFT */}
      <div className="flexflex-col items-start justify-between px-28 py-16"></div>

      {/* HIGHT */}
      <div className="flex flex-col p-16">
        <div className="flex flex-1 items-center justify-center">
          <p className="w-[360px] text-center leading-relaxed">
            Você ainda não publicou nenhum post no blog, {'    '}
            <a href="" className="undeline hover:text-gray-50">
              publicar agora!
            </a>
          </p>
        </div>
      </div>
    </main>
  )
}
