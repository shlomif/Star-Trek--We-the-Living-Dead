#!/usr/bin/perl

use strict;
use warnings;

use utf8;

use IO::All;
use JSON::MaybeXS qw(encode_json);

use Shlomif::Screenplays::EPUB;

my $gfx = 'Star-Trek--We-the-Living-Dead-cover.svg.png';
my $obj = Shlomif::Screenplays::EPUB->new(
    {
        images =>
        {
            $gfx => $gfx,
        },
    }
);
$obj->run;

my $filename = $obj->filename;
my $out_fn = $obj->out_fn;
my $target_dir = $obj->target_dir;

{
    my $epub_basename = 'Star-Trek--We-the-Living-Dead';
    $obj->epub_basename($epub_basename);
    io->file($target_dir . '/' . $obj->json_filename)->utf8->print(
        encode_json(
            {
                filename => $epub_basename,
                title => q/Star Trek: "We, the Living Dead"/,
                authors =>
                [
                    {
                        name => "Shlomi Fish",
                        sort => "Fish, Shlomi",
                    },
                ],
                contributors =>
                [
                    {
                        name => "Shlomi Fish",
                        role => "oth",
                    },
                ],
                cover => "images/$gfx",
                rights => "Creative Commons Attribution ShareAlike Unported (CC-by-3.0)",
                publisher => 'http://www.shlomifish.org/',
                language => 'en-GB',
                subjects => [
                    "Buffy",
                    "Deep Space Nine",
                    "DS9",
                    "FICTION/Humorous",
                    "FICTION/Science Fiction/General",
                    "History",
                    "Near East History",
                    "Judaism",
                    "Star Trek",
                ],
                identifier =>
                {
                    scheme => 'URL',
                    value => 'http://www.shlomifish.org/humour/Star-Trek/We-the-Living-Dead/',
                },
                contents =>
                [
                    {
                        "type" => "toc",
                        "source" => "toc.html"
                    },
                    {
                        type => 'text',
                        source => "scene-*.xhtml",
                    },
                ],
                toc  => {
                    "depth" => 2,
                    "parse" => [ "text", ],
                    "generate" => {
                        "title" => "Index"
                    },
                },
                guide => [
                    {
                        type => "toc",
                        title => "Index",
                        href => "toc.html",
                    },
                ],
            },
        ),
    );

    $obj->output_json;
}
