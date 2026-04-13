import hhp.Template;
import haxe.io.Path;
import sys.io.File;

final OUTPUT = "www";

@:hhp('page.htm')
class Page extends hhp.Template {
	final content:String;
	public function new(content) {
		this.content = content;
		super();
	}
}

class Home extends Page {
	public function new() super(hhp.Hhp.render("home.htm"));
}

function saveContent(fileName:String, content:Template) {
	File.saveContent(Path.join([OUTPUT, fileName]), content.execute());
}

function main() {
	sys.FileSystem.createDirectory(OUTPUT);

	saveContent("index.htm", new Home());

	File.copy("templates/style.css", Path.join([OUTPUT, "style.css"]));
}
