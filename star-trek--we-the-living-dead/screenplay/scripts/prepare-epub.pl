#!/usr/bin/perl

use strict;
use warnings;

use utf8;

use Shlomif::Screenplays::EPUB;

my $gfx = 'Star-Trek--We-the-Living-Dead-cover.svg.png';
my $obj = Shlomif::Screenplays::EPUB->new(
    {
        images =>
        {
            $gfx => "images/$gfx",
        },
    }
);
$obj->run;

my $out_fn = $obj->out_fn;

{
    my $epub_basename = 'Star-Trek--We-the-Living-Dead';

    $obj->epub_basename($epub_basename);

    $obj->output_json(
        {
            data =>
            {
                filename => $epub_basename,
                title => q/Star Trek: “We, the Living Dead”/,
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
                rights => "Creative Commons Attribution ShareAlike Unported 3.0 (CC-by-sa-3.0)",
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
            },
        },
    );
}
