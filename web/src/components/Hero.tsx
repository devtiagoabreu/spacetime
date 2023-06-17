import Image from 'next/image'
import devSpeechLogo from '../assets/logotipo_devspeech.svg'

export function Hero() {
  return (
    <div className="space-y-5">
      <Image src={devSpeechLogo} alt="devSpeeck" />
      <div className="max-w-[420px] space-y-1">
        <h1 className="text-5xl font-bold leading-tight text-gray-50">
          Discurse
        </h1>
        <p className="text-lg leading-relaxed">
          Compartilhe com o mundo sua experiência pessoal e profissional como
          desenvolvedor
        </p>
      </div>
      <a
        className="inline-block rounded-full bg-green-500 px-5 py-3 font-alt text-sm uppercase leading-none text-black transition-colors hover:bg-green-600"
        href=""
      >
        INICIAR UM DISCURSO
      </a>
    </div>
  )
}
