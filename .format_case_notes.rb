# frozen_string_literal: true

require "pathname"

ROOT = Pathname("判例")

META = {
  "あけぼのタクシー事件" => ["賃金と中間利益の相殺", "最判第1小昭62.4.2", "H21-労基4D、H23選-労基C、R1選-労基A・B", 4],
  "ことぶき事件" => ["管理監督者の深夜割増賃金", "最判第2小平21.12.18", "H25選-労基A・B・C", nil],
  "エヌビーシー工業事件" => ["生理休暇中の賃金", "最判第3小昭60.7.16", "H23-労基7E", 6],
  "トーコロ事件" => ["36協定の締結当事者", "最判第2小平13.6.22", "H23-労基4D", nil],
  "ノースウエスト航空事件" => ["使用者の責に帰すべき事由", "最判第2小昭62.7.17", "H17-労基1E、H21選-労基C、H24-労基1C、H26-労基4B、R5-労基6E", 4],
  "フジ興産事件" => ["就業規則と周知手続", "最判第2小平15.10.10", "H17-労基6A", 7],
  "三晃社事件" => ["競業避止義務", "最判第2小昭52.8.9", "H30選-労基C", nil],
  "三菱樹脂事件" => ["採用の自由", "最大判昭48.12.12", "H21-労基1B、H28-労基1ウ", nil],
  "三菱重工長崎造船所事件" => ["労働基準法上の労働時間", "最判第1小平12.3.9", "H14-労基4A、H19-労基5A、H20-労基4A、H22-労基4B、H27-労基6ア、H28-労基4A", nil],
  "八千代交通事件" => ["年次有給休暇の全労働日", "最判第1小平25.6.6", "H26選-労基A", 4],
  "医療法人社団康心会事件" => ["固定残業代の有効性", "最判第2小平29.7.7", "R4-労基7C", nil],
  "十和田観光電鉄事件" => ["公民権行使の保障", "最判第2小昭38.6.21", "H23-労基1C、H29-労基5エ", nil],
  "協同組合グローブ事件" => ["事業場外労働のみなし労働時間制", "最判第3小令6.4.16", nil, 3],
  "国際自動車事件" => ["割増賃金における通常の労働時間の賃金", "最判第1小令2.3.30", "R3選-労基B・C", nil],
  "大和銀行事件" => ["賞与の支給日在籍要件", "最判第1小昭57.10.7", "H22-労基3A", 5],
  "大星ビル管理事件" => ["仮眠時間と労働時間", "最判第1小平14.2.28", "H19-労基5B、H22-労基4A、H26-労基5D、H27-労基6イ", 7],
  "大林ファシリティズ事件" => ["労働基準法上の労働時間", "最判第2小平19.10.19", "R5選-労基C", nil],
  "大隅鉄工所事件" => ["退職願の撤回", "最判第3小昭62.9.18", nil, 2],
  "専修大学事件" => ["打切補償", "最判第2小平27.6.8", "H28選-労基A・B", nil],
  "小島撚糸事件" => ["違法な状況下での時間外労働", "最判第1小昭35.7.14", "H18-労基5B、H23-労基4E、R2-労基6D", 5],
  "弘前電報電話局事件" => ["時季指定と代替勤務者", "最判第2小昭62.7.10", "H20-労基5C、H27選-労基B、R5-労基7D", nil],
  "日新製鋼事件" => ["自由意思に基づく賃金相殺", "最判第2小平2.11.26", "H18-労基2B、H30-労基6B、R3-労基3ウ", nil],
  "日本ケミカル事件" => ["みなし時間外手当", "最判第1小平30.7.19", nil, 4],
  "日本シェーリング事件" => ["権利行使の抑制", "最判第1小平1.12.14", "H23-労基1A", 6],
  "日本ヒューレットパッカード事件" => ["長期無断欠勤と懲戒", "最判第2小平24.4.27", nil, nil],
  "日本勧業経済会事件" => ["損害賠償請求権との賃金相殺", "最大判昭36.5.31", "H26-労基3オ", nil],
  "日立製作所武蔵工場事件" => ["時間外労働の義務", "最判第1小平3.11.28", "H18-労基5D、H20選-労基C、H27-労基6ウ", 7],
  "時事通信社事件" => ["長期年次有給休暇の時季変更権", "最判第3小平4.6.23", "H22選-労基B、H29選-労基A・B", 4],
  "東朋学園事件" => ["産前産後休業と賞与支給要件", "最判第1小平15.12.4", "H22選-労基C", nil],
  "横浜南労基署事件" => ["労災法上の労働者", "最判第1小平8.11.28", "R2選-労基B・C", nil],
  "水道機工事件" => ["争議行為中の賃金", "最判第1小昭60.3.7", "H23-労基6B", 5],
  "沼津交通事件" => ["年次有給休暇と不利益取扱い", "最判第2小平5.6.25", nil, 5],
  "津田沼電車区事件" => ["年次有給休暇と争議行為", "最判第3小平3.11.19", nil, 3],
  "熊本総合運輸事件" => ["時間外労働等に対する対価", "最判第2小令5.3.10", nil, 5],
  "片山組事件" => ["賃金請求権", "最判第1小平10.4.9", "H26-労基1C", 4],
  "白石営林署事件" => ["年次有給休暇の請求", "最判第2小昭48.3.2", "R4-労基7E", 3],
  "目黒電報電話局事件" => ["休憩時間の自由利用", "最判第3小昭52.12.13", "H20-労基4C、H28-労基4E", nil],
  "神奈川信用農業協同組合事件" => ["選択定年制による早期退職", "最判第1小平19.1.18", nil, nil],
  "神戸弘陵学園事件" => ["試用期間と有期労働契約", "最判第3小平2.6.5", "H22選-労基A", nil],
  "福島県教組事件" => ["賃金の過払調整", "最判第1小昭44.12.18", "H21選-労基B、H27-労基4B、H29-労基6D、R3-労基3エ", 5],
  "秋北バス事件" => ["就業規則の法的規範性", "最大判昭43.12.25", "H17-労基6B・C、H22-労基2A", nil],
  "細谷服装事件" => ["予告なしの解雇", "最判第2小昭35.3.11", "H18-労基2C、H18-労基7A、H19-労基4C、H21-労基2D", nil],
  "西日本鉄道事件" => ["所持品検査規定の有効性", "最判第2小昭43.8.2", nil, 2],
  "関西医科大学研修医事件" => ["労働基準法上の労働者", "最判第2小平17.6.3", "H29-労基5オ", 5],
  "阪急トラベルサポート事件" => ["事業場外労働のみなし労働時間制", "最判第2小平26.1.24", "H27選-労基A", nil],
  "電電公社小倉電話局事件" => ["賃金債権の譲渡", "最判第3小昭43.3.12", "H21-労基4C、H28-労基3B、R4-労基6E", 7],
  "電電公社帯広電報電話局事件" => ["就業規則に基づく業務命令", "最判第1小昭61.3.13", "H17-労基6E", 4],
  "高知県観光事件" => ["歩合給と割増賃金", "最判第2小平6.6.13", "H22-労基4E", 6]
}.freeze

CONNECTORS = /\A(?:また、|しかし、|そこで、|このため、|そして、|なお、|もっとも、|したがって、|しかるところ、|他方、|一方、|以上によれば、|このような)/
NOISE = /\A(?:\d+|社労士|社労士V|労働判例100|労働基準法関係|労災保険法関係|POINT|争点|結論|事案|案|判旨|解説|確認問題|争点・結論|■表問|過去問|迎え問|週末問|西え問|地去問|幽去問|洞去問|鶏太問|帰判|事)\z/

def clean_line(line)
  line = line.strip
  line = line.gsub(/[\u0000-\u0008\u000b\u000c\u000e-\u001f]/, "")
  line = line.gsub("メたち", "Xたち").gsub("又たち", "Xたち").gsub("✕たち", "Xたち")
  line = line.gsub(/\A[\\￥]は/, "Xは").gsub(/\A！社/, "Y社").gsub(/\Aご社/, "Y社")
  line = line.gsub("労働所", "労働者").gsub("使用所", "使用者")
  line = line.gsub(/管理監[智習録]者/, "管理監督者")
  line = line.gsub("指導命令", "指揮命令").gsub("指運命令", "指揮命令")
  line = line.gsub("火作業", "実作業").gsub("使用昔", "使用者").gsub("他用者", "使用者")
  line
end

def useful(lines)
  lines.map { |l| clean_line(l) }
       .reject(&:empty?)
       .reject { |l| l.start_with?("## ") }
       .reject { |l| l.match?(NOISE) }
       .reject { |l| l.include?("労働判例100") || l.include?("社労士V") }
end

def paragraphs(lines)
  result = []
  buffer = +""
  useful(lines).each do |line|
    if !buffer.empty? && line.match?(CONNECTORS)
      result << buffer
      buffer = +""
    end
    buffer << line
  end
  result << buffer unless buffer.empty?
  result.join("\n\n")
end

def extract_answer(lines)
  idx = lines.index { |l| l.strip.match?(/\A(?:A|解答)\s*[。○◯×✕xX]?/) }
  return [lines, []] unless idx
  [lines[0...idx], lines[idx..]]
end

def question_markdown(lines)
  text = paragraphs(lines)
  text = text.gsub(/(?:\A|\n\n)(?:1?Q|Ｑ)\s*([12])\s*/, "\n\n### Q\\1\n\n")
  text = text.gsub(/(?:\A|\n\n)(?:Q|Ｑ)\s*/, "\n\n### Q1\n\n") unless text.include?("### Q")
  text.strip
end

def issue_parts(lines)
  data = lines.map { |l| clean_line(l) }.reject(&:empty?)
  data.reject! { |l| l.match?(/\A(?:\d+|社労士|社労士V|労働判例100)\z/) }
  point_at = data.index { |l| l == "POINT" }
  point_at ||= data.index { |l| l.include?("POINT") }
  point = point_at ? data[(point_at + 1)..] : []
  head = point_at ? data[0...point_at] : data
  dispute_at = head.index("争点")
  conclusion_at = head.index("結論")
  if dispute_at && conclusion_at
    dispute = head[0...dispute_at] + head[(dispute_at + 1)...conclusion_at]
    tail = head[(conclusion_at + 1)..] || []
  else
    dispute = head
    tail = []
  end
  conclusion = tail.shift || ""
  point = tail + point
  [paragraphs(dispute), clean_line(conclusion), paragraphs(point)]
end

raw_lookup = Dir["/private/tmp/case-ocr-text/*.txt"].to_h do |path|
  [File.basename(path, ".txt").unicode_normalize(:nfc), path]
end

META.each do |name, (theme, decision, exams, skip)|
  file = ROOT / name / "#{name}.md"
  next unless file.exist?
  raw_path = raw_lookup[name.unicode_normalize(:nfc)]
  next unless raw_path
  raw = File.read(raw_path)

  original = file.basename.sub_ext(".pdf").to_s
  pages = raw.split(/^---\s*$/)
  first = pages.shift.to_s.lines.map(&:chomp)
  rest = pages.join("\n").lines.map(&:chomp)

  issue_heading = first.index { |l| l.strip == "争点・結論" }
  issue_label = first.index { |l| l.strip == "争点" }
  issue_at = issue_heading || issue_label
  verdict_on_first = first.index { |l| l.strip == "判旨" }
  before_issue = issue_at ? first[0...issue_at] : first
  issue_end = verdict_on_first || first.length
  issue_lines = issue_at ? first[(issue_at + 1)...issue_end] : []
  verdict_prefix = verdict_on_first ? first[(verdict_on_first + 1)..] : []

  story_heading = before_issue.rindex { |l| l.strip == "事案" }
  story = if story_heading
            before_issue[(story_heading + 1)..]
          else
            useful(before_issue.drop(skip || 0))
          end

  # Section markers on the second and later pages are substantially more
  # reliable than page-one column ordering, so retain them as split points.
  verdict_at = rest.index { |l| l.strip == "判旨" }
  explain_at = rest.index { |l| l.strip == "解説" }
  question_at = rest.index { |l| l.strip == "確認問題" || l.strip == "確認間題" }

  content_start = verdict_at ? verdict_at + 1 : 0
  verdict_end = [explain_at, question_at].compact.select { |i| i >= content_start }.min || rest.length
  verdict = verdict_prefix + rest[content_start...verdict_end]

  if explain_at
    explain_end = question_at && question_at > explain_at ? question_at : rest.length
    explanation = rest[(explain_at + 1)...explain_end]
  else
    inferred_explain = rest.index.with_index do |line, i|
      i >= content_start && line.strip.match?(/\A(?:なお、)?この判例では/)
    end
    if inferred_explain && (!question_at || inferred_explain < question_at)
      verdict = verdict_prefix + rest[content_start...inferred_explain]
      explain_end = question_at || rest.length
      explanation = rest[inferred_explain...explain_end]
    else
      explanation = []
    end
  end

  questions = question_at ? rest[(question_at + 1)..] : []
  questions, answers = extract_answer(questions)

  dispute, conclusion, point = issue_parts(issue_lines)

  out = []
  out << "# #{name}"
  out << ""
  out << "- テーマ：#{theme}"
  out << "- 判決：#{decision}"
  out << "- 過去問：#{exams}" if exams
  out << "- 原本：[[#{original}]]"
  out << ""
  out << "## 事案"
  out << ""
  out << paragraphs(story)
  out << ""
  out << "## 争点・結論"
  out << ""
  out << "**争点**：#{dispute}"
  out << ""
  out << "**結論**：#{conclusion}"
  unless point.empty?
    out << ""
    out << "> [!important] POINT"
    point.split("\n\n").each_with_index do |para, i|
      out << ">" if i.positive?
      para.scan(/.{1,200}(?:。|\z)/m).each { |part| out << "> #{part.strip}" }
    end
  end
  out << ""
  out << "## 判旨"
  out << ""
  out << paragraphs(verdict)
  out << ""
  out << "## 解説"
  out << ""
  out << paragraphs(explanation)
  out << ""
  out << "## 確認問題"
  out << ""
  out << question_markdown(questions)
  out << ""
  out << "## 解答"
  out << ""
  answer_text = paragraphs(answers)
  answer_text = "（PDF原本の解答欄を参照）" if answer_text.empty?
  answer_text = "**○**" if answer_text.match?(/\AA[。\.o○◯]?\z/i)
  answer_text = answer_text.sub(/\AA\s*[x×✕]\s*/i, "**×**　")
  answer_text = answer_text.sub(/\AA\s*[o○◯]\s*/i, "**○**　")
  out << answer_text
  out << ""

  file.write(out.join("\n").gsub(/\n{3,}/, "\n\n"))
end
