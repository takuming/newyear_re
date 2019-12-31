module ApplicationHelper
  def default_meta_tags
    {
      title: 'NEWYEAR',
      reverse: true,
      description: 'ディスクリプション',
      keywords: '',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
      ],
      og: {
        site_name: 'NEWYEAR',
        title: 'NEWYEAR 今年のじぶんと旅に出る | １年の振り返りから、来年やってみたいことがつくれるセルフコーチングサービス',
        description: '今年のじぶんと旅に出る | １年の振り返りから、来年やってみたいことがつくれるセルフコーチングサービス', 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@takumii_kai',
      }
      fb: {
        app_id: ''
      }
    }
  end
end
